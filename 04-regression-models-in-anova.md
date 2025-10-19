## Regression Models in ANOVA

The table below is a taxonomy of regression models used in the ANOVA framework for designed experiments and observational studies.

| **Model Family** | **Outcome Type** | **Conditional Function** | **Link Function** | **Distribution** | **Common Nomenclature** |
|------------|------------|------------|------------|------------|------------|
| **Linear Models** | Arithmetic mean | E(Y\|X) = Xβ | Identity | Normal | ANOVA, ANCOVA, MANOVA |
| **Quantile Models** | Conditional quantile (e.g., median) | Q_τ(Y\|X) = Xβ | Identity | Asymmetric Laplace | Quantile ANOVA |
| **Generalized Linear Models (GLM)** | Mean of transformed outcome | g(E(Y\|X)) = Xβ | Various (see below) | Exponential family | — |
| ↳ Logistic | Proportion/probability | logit(E(Y\|X)) = Xβ | Logit | Binomial | Logistic ANOVA |
| ↳ Probit | Proportion/probability | Φ\^(-1)(E(Y\|X)) = Xβ | Probit | Binomial | Probit ANOVA |
| ↳ Log-linear | Count/rate | log(E(Y\|X)) = Xβ | Log | Poisson | Poisson ANOVA |
| ↳ Negative Binomial | Overdispersed count | log(E(Y\|X)) = Xβ | Log | Negative Binomial | NB ANOVA |
| ↳ Gamma | Positive continuous | log(E(Y\|X)) = Xβ | Log (or inverse) | Gamma | Gamma ANOVA |
| **Survival Models** | Hazard rate | log(λ(t\|X)) = Xβ | Log | — | Cox ANOVA |
| ↳ Parametric survival | Hazard/survival time | Varies by distribution | Log or identity | Weibull, exponential, etc. | Parametric survival ANOVA |
| **Ordinal Models** | Cumulative probability | logit(P(Y≤j\|X)) = α_j - Xβ | Cumulative logit | Multinomial | Ordinal ANOVA |
| **Multinomial Models** | Category probability | log(P(Y=j\|X)/P(Y=ref\|X)) = Xβ_j | Generalized logit | Multinomial | Multinomial ANOVA |
| **Zero-inflated Models** | Count with excess zeros | Mixed (logit + log) | Compound | ZIP, ZINB | ZI ANOVA |
| **Beta Regression** | Proportion (0,1) | g(E(Y\|X)) = Xβ | Logit, probit, etc. | Beta | Beta ANOVA |
| **Tobit Models** | Censored continuous | E(Y\*\|X) = Xβ | Identity | Normal | Tobit ANOVA |
