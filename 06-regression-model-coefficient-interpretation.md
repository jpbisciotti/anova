# Interpreting Regression Coefficients Across ANOVA Models

This document explains how to interpret intercepts and coefficients for each regression model in your taxonomy. 

Each section includes an example you might find/write in a statistical report.

---

## Linear Models: ANOVA, ANCOVA, MANOVA

What the intercept represents:
The intercept is the expected mean outcome when all predictors equal zero (or at the reference category for factors).

What a coefficient represents:
Each coefficient represents the change in the mean outcome for a one-unit increase in the predictor, holding other variables constant.

Example interpretation:
"Plants receiving the high-nutrient treatment yielded 12.3 kg more fruit on average than control plants (Beta = 12.3, SE = 2.1, p < 0.001). The intercept of 45.2 kg represents the mean yield for control plants."

---

## Quantile Models 

What the intercept represents:
The intercept is the estimated value of the specified quantile (for example, the median) when all predictors equal zero.

What a coefficient represents:
Each coefficient represents the change in the specified quantile of the outcome for a one-unit increase in the predictor. If you're modeling the median (Tau = 0.5), the coefficient shows how the median shifts.

Example interpretation:
"At the median, reaction time increased by 45 milliseconds per decade of age (Beta_0.50 = 45 ms, 95% CI: 32-58 ms). The intercept of 285 ms represents the median reaction time at age zero. Analysis of the 90th percentile showed a larger effect (Beta_0.90 = 78 ms), indicating greater age-related slowing among slower responders."

---

## Logistic Regression 

What the intercept represents:
The intercept is the log-odds of the outcome when all predictors equal zero. After exponentiating, it becomes the odds of the outcome at the reference level.

What a coefficient represents:
Each coefficient represents the change in log-odds for a one-unit increase in the predictor. After exponentiating (e^Beta), you get the odds ratio (the multiplicative change in odds).

Example interpretation:
"The odds of treatment success were 2.8 times higher for patients receiving the intervention compared to controls (OR = 2.8, 95% CI: 1.9-4.1, p < 0.001). Each additional year of disease duration decreased the odds of success by 15% (OR = 0.85, 95% CI: 0.78-0.92, p < 0.001)."

---

## Probit Regression 

What the intercept represents:
The intercept is the z-score (standard normal value) corresponding to the probability of the outcome when all predictors equal zero.

What a coefficient represents:
Each coefficient represents the change in the z-score for a one-unit increase in the predictor. You can convert coefficients to changes in probability, though these changes depend on where you are on the probability scale.

Example interpretation:
"Increasing study time by one hour increased the probit score for passing by 0.34 units (Beta = 0.34, SE = 0.08, p < 0.001). For a student at the median study time (5 hours), this translates to an 11 percentage point increase in pass probability (from 64% to 75%)."

---

## Poisson Regression 

What the intercept represents:
The intercept is the log of the expected count when all predictors equal zero. After exponentiating, it becomes the expected count at the reference level.

What a coefficient represents:
Each coefficient represents the change in log count for a one-unit increase in the predictor. After exponentiating (e^Beta), you get the rate ratio (the multiplicative change in the expected count).

Example interpretation:
"Sites with canopy cover had 1.7 times the bird species count compared to open sites (rate ratio = 1.7, 95% CI: 1.4-2.1, p < 0.001). Each 10% increase in native plant cover was associated with a 12% increase in species count (rate ratio = 1.12, 95% CI: 1.06-1.18, p < 0.001)."

---

## Negative Binomial (NB) Regression 

What the intercept represents:
The intercept is the log of the expected count when all predictors equal zero, accounting for overdispersion. After exponentiating, it becomes the expected count at the reference level.

What a coefficient represents:
Each coefficient represents the change in log count for a one-unit increase in the predictor. After exponentiating, you get the rate ratio. Interpretation is identical to Poisson regression, but the model accounts for greater variance than the mean.

Example interpretation:
"Emergency department visits increased by a factor of 3.2 during heat waves compared to normal weather (rate ratio = 3.2, 95% CI: 2.1-4.9, p < 0.001). The dispersion parameter (θ = 2.4) indicated substantial overdispersion, justifying the use of negative binomial rather than Poisson regression."

---

## Gamma Regression 

What the intercept represents:
With a log link, the intercept is the log of the expected outcome when all predictors equal zero. After exponentiating, it becomes the expected value at the reference level.

What a coefficient represents:
With a log link, each coefficient represents the change in log outcome for a one-unit increase in the predictor. After exponentiating, you get the multiplicative change in the expected outcome.

Example interpretation:
"Hospital stays were 1.5 times longer for patients with complications compared to those without (mean ratio = 1.5, 95% CI: 1.3-1.8, p < 0.001). Each additional comorbidity increased length of stay by 23% (mean ratio = 1.23, 95% CI: 1.15-1.32, p < 0.001)."

---

## Cox Proportional Hazards (Cox)

What the intercept represents:
There is no intercept in the standard Cox model. The model estimates the hazard relative to an unspecified baseline hazard function.

What a coefficient represents:
Each coefficient represents the change in log hazard for a one-unit increase in the predictor. After exponentiating (e^Beta), you get the hazard ratio (the multiplicative change in the instantaneous risk of the event).

Example interpretation:
"Patients in the treatment group had a 42% reduction in mortality risk compared to controls (HR = 0.58, 95% CI: 0.45-0.75, p < 0.001). Each 10-point increase in baseline disease severity score increased the hazard of death by 28% (HR = 1.28, 95% CI: 1.18-1.39, p < 0.001)."

---

## Parametric Survival Models 

What the intercept represents:
The intercept depends on the parameterization. For an accelerated failure time (AFT) model with a log link, the intercept is the log of the expected survival time at the reference level.

What a coefficient represents:
In AFT models, coefficients represent changes in log survival time. After exponentiating, you get time ratios (the multiplicative change in expected survival time). The interpretation depends on the chosen distribution (Weibull, exponential, etc.).

Example interpretation:
"Using a Weibull AFT model, machines with preventive maintenance had 2.1 times longer time to failure compared to machines without maintenance (time ratio = 2.1, 95% CI: 1.7-2.6, p < 0.001). Each degree increase in operating temperature decreased expected time to failure by 3% (time ratio = 0.97, 95% CI: 0.95-0.99, p = 0.004)."

---

## Ordinal Regression 

What the intercept represents:
There are multiple intercepts (cutpoints), one for each transition between adjacent outcome categories. Each intercept is the log-odds of being in that category or below when all predictors equal zero.

What a coefficient represents:
Each coefficient represents the change in log cumulative odds for a one-unit increase in the predictor, assuming proportional odds across all cutpoints. After exponentiating, you get the cumulative odds ratio. A positive coefficient means higher predictor values are associated with higher outcome categories.

Example interpretation:
"Patients receiving physical therapy had 3.2 times the odds of being in a better pain category compared to controls, holding the cutpoints constant (OR = 3.2, 95% CI: 2.1-4.9, p < 0.001). The proportional odds assumption was satisfied (p = 0.18), indicating the treatment effect was consistent across all pain levels."

---

## Multinomial Regression 

What the intercept represents:
Each outcome category (except the reference) has its own intercept. Each intercept is the log-odds of being in that category versus the reference category when all predictors equal zero.

What a coefficient represents:
Each predictor has separate coefficients for each outcome category (except the reference). Each coefficient represents the change in log-odds of being in that category versus the reference for a one-unit increase in the predictor. After exponentiating, you get the relative risk ratio.

Example interpretation:
"Compared to choosing the control treatment, the relative risk of choosing chemotherapy over surgery increased by a factor of 2.4 for each 10-year increase in age (RRR = 2.4, 95% CI: 1.8-3.2, p < 0.001). However, age had no significant effect on the choice between radiation and surgery (RRR = 1.1, 95% CI: 0.8-1.5, p = 0.52)."

---

## Zero-Inflated (ZI) Models 

What the intercept represents:
These models have two intercepts: one for the logistic component (probability of being in the zero state) and one for the count component (expected count for non-zero states).

What a coefficient represents:
Each predictor can affect both components. For the zero-inflation component, coefficients are interpreted as log-odds (like logistic regression). For the count component, coefficients are interpreted as rate ratios (like Poisson or negative binomial regression).

Example interpretation:
"The zero-inflated Poisson model indicated two distinct processes. Sites with high human disturbance had 4.2 times the odds of having structural zeros (no species present; OR = 4.2, 95% CI: 2.3-7.6, p < 0.001). Among sites where species were present, each unit increase in habitat quality increased species count by 38% (rate ratio = 1.38, 95% CI: 1.19-1.60, p < 0.001)."

---

## Beta Regression 

What the intercept represents:
With a logit link, the intercept is the logit of the expected proportion when all predictors equal zero. After back-transforming, it becomes the expected proportion at the reference level.

What a coefficient represents:
With a logit link, each coefficient represents the change in the logit of the proportion for a one-unit increase in the predictor. You can exponentiate to get odds ratios, though you're more likely to report effects on the proportion scale.

Example interpretation:
"Plots with integrated pest management had a 12 percentage point higher mean proportion of unblemished fruit compared to conventional plots (0.78 vs. 0.66, difference = 0.12, 95% CI: 0.08-0.16, p < 0.001). On the logit scale, this corresponds to an odds ratio of 1.8 (95% CI: 1.4-2.3)."

---

## Tobit Models 

What the intercept represents:
The intercept is the expected value of the latent (uncensored) outcome variable when all predictors equal zero. This differs from the observed outcome's expected value due to censoring.

What a coefficient represents:
Each coefficient represents the change in the latent outcome variable for a one-unit increase in the predictor. This is the change in the underlying continuous variable before censoring is applied.

Example interpretation:
"Using a Tobit model to account for left-censoring at zero expenditure, household income increased healthcare spending by $45 per $1,000 increase in annual income (Beta = 45, SE = 8, p < 0.001). This represents the effect on latent healthcare demand, including both households with zero observed spending and those with positive spending."

---

## Quick Reference: When Coefficients Are on Different Scales

### Format 1: Groups of unordered lists

You interpret coefficients directly on the outcome scale:
- Linear models (change in mean)
- Quantile models (change in quantile)
- Tobit models (change in latent variable)

You interpret exponentiated coefficients (e^Beta):
- Logistic regression (odds ratios)
- Poisson and negative binomial (rate ratios)
- Gamma regression (mean ratios)
- Cox models (hazard ratios)
- Ordinal regression (cumulative odds ratios)
- Multinomial regression (relative risk ratios)

You interpret coefficients in two parts:
- Zero-inflated models (odds for zero-inflation + rate ratio for counts)
- Parametric survival (depends on model; check whether it's proportional hazards or AFT)

Special cases:
- Probit: coefficients are on the z-score scale (convert to probability changes)
- Beta regression: coefficients depend on link function (logit is most common)
- Ordinal models: multiple intercepts represent category cutpoints

### Format 2: Tabular 

| Model Type | Interpretation Approach | What You Report | Notes |
|----------------|----------------------------|---------------------|-----------|
| Linear models | Direct interpretation | Change in mean | -- |
| Quantile models | Direct interpretation | Change in quantile (e.g., median) | -- |
| Tobit models | Direct interpretation | Change in latent variable | Accounts for censoring |
| Logistic regression | Exponentiate coefficient (e^Beta) | Odds ratios | -- |
| Poisson regression | Exponentiate coefficient (e^Beta) | Rate ratios | -- |
| Negative binomial | Exponentiate coefficient (e^Beta) | Rate ratios | -- |
| Gamma regression | Exponentiate coefficient (e^Beta) | Mean ratios | -- |
| Cox models | Exponentiate coefficient (e^Beta) | Hazard ratios | -- |
| Ordinal regression | Exponentiate coefficient (e^Beta) | Cumulative odds ratios | Multiple intercepts represent category cutpoints |
| Multinomial regression | Exponentiate coefficient (e^Beta) | Relative risk ratios | -- |
| Zero-inflated models | Two-part interpretation | (1) Odds for zero-inflation + (2) Rate ratio for counts | Separate coefficients for each component |
| Parametric survival | Depends on model specification | Hazard ratios (PH) or Time ratios (AFT) | Check whether proportional hazards or accelerated failure time |
| Probit regression | Convert from z-score scale | Probability changes | Coefficients are on z-score scale |
| Beta regression | Depends on link function | Varies by link (typically odds ratios for logit) | Logit link is most common |

Table Key:
- Direct interpretation: Coefficient represents change on the outcome scale (report Beta)
- Exponentiate coefficient: Transform coefficient before interpreting (report e^Beta)
- Two-part interpretation: Model has separate components requiring different interpretations
- PH: Proportional hazards parameterization
- AFT: Accelerated failure time parameterization
