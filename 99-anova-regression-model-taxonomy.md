# Taxonomy of Regression Models in ANOVA Framework

## Table of Models

| Model Family | Outcome Type | Conditional Function | Link Function | Distribution | Common Nomenclature |
|------------------|------------------|--------------------------|-------------------|------------------|-------------------------|
| Linear Models | Arithmetic mean | E(Y\|X) = Xβ | Identity | Normal | ANOVA, ANCOVA, MANOVA |
| Quantile Models | Conditional quantile (e.g., median) | Q_τ(Y\|X) = Xβ | Identity | Asymmetric Laplace | Quantile ANOVA |
| Generalized Linear Models (GLM) | Mean of transformed outcome | g(E(Y\|X)) = Xβ | Various (see below) | Exponential family | — |
| GLM: Logistic | Proportion/probability | logit(E(Y\|X)) = Xβ | Logit | Binomial | Logistic ANOVA |
| GLM: Probit | Proportion/probability | Φ^(-1)(E(Y\|X)) = Xβ | Probit | Binomial | Probit ANOVA |
| GLM: Log-linear | Count/rate | log(E(Y\|X)) = Xβ | Log | Poisson | Poisson ANOVA |
| GLM: Negative Binomial | Overdispersed count | log(E(Y\|X)) = Xβ | Log | Negative Binomial | NB ANOVA |
| GLM: Gamma | Positive continuous | log(E(Y\|X)) = Xβ | Log (or inverse) | Gamma | Gamma ANOVA |
| Survival Models | Hazard rate | log(λ(t\|X)) = Xβ | Log | — | Cox ANOVA |
| Survival: Parametric survival | Hazard/survival time | Varies by distribution | Log or identity | Weibull, exponential, etc. | Parametric survival ANOVA |
| Ordinal Models | Cumulative probability | logit(P(Y≤j\|X)) = α_j - Xβ | Cumulative logit | Multinomial | Ordinal ANOVA |
| Multinomial Models | Category probability | log(P(Y=j\|X)/P(Y=ref\|X)) = Xβ_j | Generalized logit | Multinomial | Multinomial ANOVA |
| Zero-inflated Models | Count with excess zeros | Mixed (logit + log) | Compound | ZIP, ZINB | ZI ANOVA |
| Beta Regression | Proportion (0,1) | g(E(Y\|X)) = Xβ | Logit, probit, etc. | Beta | Beta ANOVA |
| Tobit Models | Censored continuous | E(Y*\|X) = Xβ | Identity | Normal | Tobit ANOVA |

## By Dimensions of Complexity

### Dimension 1: By Number of Response Variables

#### A. Univariate Models (Single Response)
- Standard ANOVA/regression framework
- One outcome variable analyzed

#### B. Multivariate Models (Multiple Responses)
- MANOVA (Multivariate ANOVA): Multiple continuous outcomes, linear model
- Multivariate GLM: Multiple outcomes with GLM structure
- Seemingly Unrelated Regression (SUR): Correlated error structures across equations
- Multivariate Quantile Regression: Multiple conditional quantiles

### Dimension 2: By Number and Structure of Categorical Predictors

| Design | Number of Factors | Model Notation | Example |
|------------|----------------------|-------------------|-------------|
| One-way | 1 | Y = μ + α_i + ε | Treatment effect |
| Two-way | 2 | Y = μ + α_i + β_j + ε | Treatment × Gender |
| Three-way | 3 | Y = μ + α_i + β_j + γ_k + ε | Treatment × Gender × Age group |
| k-way | k | Y = μ + α₁ + α₂ + ... + α_k + ε | Multiple factors |

With interactions:
- Two-way with interaction: Y = μ + α_i + β_j + (αβ)_ij + ε
- Factorial designs: All possible interactions included
- Fractional factorial: Subset of interactions

### Dimension 3: Presence of Continuous Covariates

| Design Type | Covariates | Model Form | Name |
|-----------------|----------------|----------------|----------|
| No covariates | None | Y = factors + ε | ANOVA |
| With covariates | ≥1 continuous | Y = factors + covariates + ε | ANCOVA |
| Homogeneous slopes | Covariate effects constant | Y = α_i + βZ + ε | Standard ANCOVA |
| Heterogeneous slopes | Covariate effects vary by group | Y = α_i + β_iZ + ε | ANCOVA with interaction |

### Dimension 4: Effects Structure

| Model Type | Factor Treatment | Use Case |
|----------------|---------------------|--------------|
| Fixed Effects | All levels of interest included | Inference about specific groups |
| Random Effects | Levels sampled from population | Variance components, generalization |
| Mixed Effects | Both fixed and random | Nested/hierarchical designs, repeated measures |

### Dimension 5: Experimental Design Structure

| Design | Structure | Model Considerations |
|------------|--------------|-------------------------|
| Completely Randomized | Units randomly assigned to treatments | Standard ANOVA |
| Randomized Block | Units grouped into blocks | Block as factor or random effect |
| Latin Square | Two blocking factors | Row and column effects |
| Nested Design | Factors nested within others | A within B: B(A) |
| Split-Plot | Different randomization levels | Whole-plot and sub-plot errors |
| Repeated Measures | Same units measured multiple times | Correlation structure, sphericity |
| Crossover | Units receive multiple treatments | Period and carryover effects |

### Dimension 6: Model Assumptions and Extensions

| Assumption Violation | Standard ANOVA | Robust Alternative |
|-------------------------|-------------------|----------------------|
| Non-normal errors | Assumes normality | Quantile regression, rank-based methods |
| Heteroscedasticity | Homogeneous variance | Weighted least squares, sandwich estimators |
| Outliers | Sensitive | Robust regression (M-estimators, LAD) |
| Missing data | Complete cases | Mixed models with ML/REML, multiple imputation |
| Non-linear relationships | Linear in parameters | GAM (Generalized Additive Models), polynomial terms |

## Comprehensive Model Matrix: Crossing Key Dimensions

| Outcome | One-Way | Two-Way | With Covariate | With Interaction | Multivariate |
|-------------|-------------|-------------|-------------------|---------------------|------------------|
| Continuous (mean) | One-way ANOVA | Two-way ANOVA | ANCOVA | Factorial ANOVA | MANOVA |
| Median | Median one-way | Median two-way | Quantile ANCOVA | Quantile factorial | Multivariate quantile |
| Binary (proportion) | Logistic one-way | Logistic two-way | Logistic ANCOVA | Logistic factorial | Multivariate logistic |
| Count | Poisson one-way | Poisson two-way | Poisson ANCOVA | Poisson factorial | Multivariate count |
| Time-to-event | Cox one-way | Cox two-way | Cox ANCOVA | Cox factorial | Multivariate survival |
| Ordinal | Ordinal one-way | Ordinal two-way | Ordinal ANCOVA | Ordinal factorial | — |

---

## Special Cases and Extensions

### Non-standard Regression Models in ANOVA Framework

1. Generalized Estimating Equations (GEE): Population-averaged effects with correlated data
2. Generalized Additive Models (GAM): Non-parametric smooth functions of covariates
3. Quantile Regression: Any conditional quantile (not just median)
4. Robust Regression: M-estimators, trimmed means
5. Bayesian ANOVA: Posterior distributions for effects
6. Non-parametric ANOVA: Kruskal-Wallis, Friedman test
7. Permutation/Randomization Tests: Distribution-free inference
8. Transformation Models: Box-Cox, log-transform
9. Hurdle Models: Two-part models (zero vs. positive)
10. Finite Mixture Models: Latent class ANOVA

## Summary Framework

Complete model specification requires specification of:

1. Outcome type: Determines distributional family
2. Link function: Connects linear predictor to outcome
3. Number of responses: Univariate vs. multivariate
4. Number of factors: One-way, two-way, k-way
5. Interaction terms: Main effects only vs. interactions
6. Covariates: ANOVA vs. ANCOVA
7. Effects type: Fixed, random, or mixed
8. Design structure: CRD, RBD, split-plot, repeated measures, etc.
9. Variance structure: Homogeneous, heterogeneous, correlated
10. Estimation method: ML, REML, GEE, robust, Bayesian

This taxonomy encompasses the vast majority of regression models used within the ANOVA framework for designed experiments and observational studies with categorical predictors.
