# Automated Distribution Fitting
# Fit distribution using MLE. 
# Identify best-fitting distribution for unknown data

# ==============================================================================

fit_distributions <- function(
    x
    ) {
  
  # ==============================================================================
  
  # metric <- "aic"
  x <- x[!is.na(x)]
  
  # Initialize results structure
  possible_distributions_original <- character(0)
  possible_distributions <- possible_distributions_original
  
  # ==============================================================================
  
  # STAGE 1: DATA TYPE AND RANGE CHECKS
  
  # Continuous?
  is_integer <- all(x == floor(x))
  is_double <- !is_integer
  is_continuous <- is_double
  
  # Count?
  is_nonnegative <- all(x >= 0)
  is_count <- is_integer & is_nonnegative
  
  # Proportion?
  is_proportion <- all(x >= 0 & x <= 1) & is_continuous
  
  # ==============================================================================
  
  # STAGE 2: INITIAL CATEGORIZATION BY TYPE 
  
  if (is_proportion) {
    possible_distributions <- c(possible_distributions, "beta")
    cli::cli_alert_info("PROPORTION ...")
  }
  
  if (is_count) {
    possible_distributions <- c(possible_distributions, "binom", "geom", "hyper", "nbinom", "pois")
    cli::cli_alert_info("COUNT ...")
  }
  
  if (is_continuous) {
    # CONTINUOUS NONNEGATIVE DISTRIBUTIONS
    possible_distributions <- c(possible_distributions, "chisq", "exp", "f", "gamma", "lnorm", "weibull", "cauchy", "norm", "t", "unif")
    cli::cli_alert_info("CONTINUOUS ...")
  }
  
  # ==============================================================================
  
  fit_one_distribution <- function(
    data, 
    density_fun, 
    initial_params, 
    lower_bounds, 
    upper_bounds = NULL, 
    param_names = NULL,
    transform_params = NULL, 
    extra_constraints = NULL
  ) {
    
    # Define negative log-likelihood function
    nll_fun <- function(params, data) {
      # Return large value if any parameter constraints violated
      if (any(params <= lower_bounds) || 
          (!is.null(upper_bounds) && any(params >= upper_bounds))) {
        return(1e10)
      }
      
      # Apply parameter transformations if specified (e.g., rounding for integers)
      if (!is.null(transform_params)) {
        params <- transform_params(params)
      }
      
      # Check extra constraints if specified
      if (!is.null(extra_constraints)) {
        if (!extra_constraints(params, data)) {
          return(1e10)
        }
      }
      
      # Calculate negative log-likelihood
      -sum(do.call(density_fun, c(list(x = data), as.list(params), list(log = TRUE))))
    }
    
    # Run optimization
    optim_args <- list(
      par = initial_params,
      fn = nll_fun,
      data = data,
      method = "L-BFGS-B",
      lower = lower_bounds
    )
    
    # Only add upper bounds if specified
    if (!is.null(upper_bounds)) {
      optim_args$upper <- upper_bounds
    }
    
    optim_result <- do.call(optim, optim_args)
    
    # Calculate model fit metrics
    k <- length(initial_params)
    log_lik <- -optim_result$value
    aic <- 2 * k - 2 * log_lik
    bic <- k * log(length(data)) - 2 * log_lik
    convergence_success <- optim_result$convergence == 0
    
    # Return results
    list(
      params = optim_result$par,
      log_lik = log_lik,
      aic = aic,
      bic = bic,
      convergence = convergence_success,
      param_names = param_names
    )
  }
  
  # ==============================================================================
  
  # Define distribution configurations
  
  dist_configs <- list(
    beta = list(
      density = dbeta, 
      initial = c(1, 1), 
      lower = c(0.01, 0.01),
      names = c("shape1", "shape2")
    ),
    chisq = list(
      density = dchisq, 
      initial = c(5), 
      lower = c(0.01),
      names = c("df")
    ),
    exp = list(
      density = dexp, 
      initial = c(1), 
      lower = c(0.01),
      names = c("rate")
    ),
    f = list(
      density = df, 
      initial = c(5, 5), 
      lower = c(0.01, 0.01),
      names = c("df1", "df2")
    ),
    gamma = list(
      density = dgamma, 
      initial = c(2, 1), 
      lower = c(0.01, 0.01),
      names = c("shape", "rate")
    ),
    lnorm = list(
      density = dlnorm, 
      initial = c(0, 1), 
      lower = c(-Inf, 0.01),
      names = c("meanlog", "sdlog")
    ),
    weibull = list(
      density = dweibull, 
      initial = c(1, 1), 
      lower = c(0.01, 0.01),
      names = c("shape", "scale")
    ),
    cauchy = list(
      density = dcauchy, 
      initial = c(0, 1), 
      lower = c(-Inf, 0.01),
      names = c("location", "scale")
    ),
    norm = list(
      density = dnorm, 
      initial = c(0, 1), 
      lower = c(-Inf, 0.01),
      names = c("mean", "sd")
    ),
    t = list(
      density = dt, 
      initial = c(5), 
      lower = c(0.01),
      names = c("df")
    ),
    unif = list(
      density = dunif, 
      initial = c(min(x) - 0.1, max(x) + 0.1), 
      lower = c(-Inf, min(x)),
      names = c("min", "max"),
      extra_constraints = function(params, data) {
        params[1] < params[2] && all(data >= params[1]) && all(data <= params[2])
      }
    ),
    binom = list(
      density = dbinom, 
      initial = c(max(x), 0.5), 
      lower = c(max(x), 0.01),
      upper = c(Inf, 0.99),
      names = c("size", "prob"),
      transform_params = function(params) {
        c(round(params[1]), params[2])
      }
    ),
    geom = list(
      density = dgeom, 
      initial = c(0.5), 
      lower = c(0.01),
      upper = c(0.99),
      names = c("prob")
    ),
    hyper = list(
      density = dhyper, 
      initial = c(max(x), max(x), length(x)), 
      lower = c(max(x), 1, max(x)),
      names = c("m", "n", "k"),
      transform_params = function(params) {
        round(params)
      },
      extra_constraints = function(params, data) {
        params <- round(params)
        params[3] <= (params[1] + params[2])
      }
    ),
    nbinom = list(
      density = dnbinom, 
      initial = c(1, 0.5), 
      lower = c(0.01, 0.01),
      upper = c(Inf, 0.99),
      names = c("size", "prob")
    ),
    pois = list(
      density = dpois, 
      initial = c(mean(x)), 
      lower = c(0.01),
      names = c("lambda")
    )
  )
  
  # ==============================================================================
  
  # Fit each requested distribution
  
  results <- list()
  
  for (dist_name in possible_distributions) {
    if (dist_name %in% names(dist_configs)) {
      config <- dist_configs[[dist_name]]
      results[[dist_name]] <- fit_one_distribution(
        data = x,
        density_fun = config$density,
        initial_params = config$initial,
        lower_bounds = config$lower,
        upper_bounds = config$upper,
        param_names = config$names,
        transform_params = config$transform_params,
        extra_constraints = config$extra_constraints
      )
    }
  }
  
  results
  
}

data_beta <- rbeta(100, shape1 = 2, shape2 = 5)
data_binomial <- rbinom(1000, size = 10, prob = 0.5)
data_cauchy <- rcauchy(n = 1000, location = 0, scale = 1)
data_chisq <- rchisq(n = 1000, df = 2, ncp = 0)
data_exp <- rexp(n = 1000, rate = 1)
data_f <- rf(n = 1000, df1 = 2, df2 = 2, ncp = 0)
data_gamma <- rgamma(n = 1000, shape = 1, rate = 1)
data_geom <- rgeom(n = 1000, prob = 0.5)
data_hyper <- rhyper(nn = 1000, m = 10, n = 500, k = 8)
data_lnorm <- rlnorm(n = 1000, meanlog = 0, sdlog = 1)
data_rnbinom <- rnbinom(n = 1000, size = 100, prob = 0.5)
data_norm <- rnorm(n = 1000, mean = 0, sd = 1)
data_pois <- rpois(n = 1000, lambda = 3)
data_t <- rt(n = 1000, df = 2, ncp = 0)
data_unif <- runif(n = 1000, min = 0, max = 1)
data_weibull <- rweibull(n = 1000, shape = 2, scale = 1)

results <- fit_distributions(data_weibull)

# to investigate
# data_cauchy
# data_hyper
# data_rnbinom
# data_norm
# data_t

tibble::enframe(results) |>
  tidyr::unnest_wider(value) |> 
  dplyr::arrange(desc(log_lik)) |> 
  dplyr::slice(1:5) |> 
  tidyr::unnest(c(params, param_names)) |>
  dplyr::select(name, log_lik, aic, bic, convergence)

plot(sort(rbeta(1000, 2.11, 5.48)), sort(rbeta(1000, 2, 5)))

plot(sort(rbeta(1000, 2.11, 5.48)), sort(rgamma(1000, 2.95, 10.7)))

plot(sort(data_beta), sort(rbeta(100, 2, 5)))

plot(sort(data_beta), sort(rgamma(100, 2.95, 10.7)))
