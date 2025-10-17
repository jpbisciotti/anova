# Post-Modeling ANOVA EDA

## Why Check Model Diagnostics

After you fit your ANOVA model, examine residuals to verify that your model meets assumptions. These checks reveal problems that raw data exploration might miss.

## Check Residual Normality

### Examine the overall model residuals

Check whether your model residuals are approximately normal:

- **Create a QQ plot of residuals.** Points falling along the diagonal indicate normality.
- **Create a histogram of residuals.** Look for a bell-shaped curve centered near zero.
- **Compare patterns across groups.** Residuals should be approximately normal within each group.

Residual checks are more important than raw data checks because ANOVA assumes normally distributed errors (residuals), not normally distributed raw data.

### Interpret normality violations

Small departures from normality are acceptable, especially with large sample sizes:

- **Severe departures at any sample size:** Consider transformations or non-parametric alternatives.

## Check Homogeneity of Variance

### Examine residual plots

Create plots to assess whether variance is constant:

- **Plot residuals versus fitted values.** Look for a random scatter of points with constant spread across the range of fitted values.
- **Plot residuals by group.** Check whether spread is similar across groups.

### Identify HOV violations

Look for these patterns that indicate problems:

- **Funnel shape:** Variance increases with the mean (consider log transformation)
- **Double funnel:** Variance is highest at middle values (less common)
- **Unequal spread by group:** Some groups show much more variability than others (consider Welch's ANOVA)

## Assess Outlier Influence

### Calculate influence diagnostics

Determine whether outliers you identified earlier affect your conclusions:

- **Calculate Cook's distance for each observation.** Values exceeding 1.0 warrant investigation. Values exceeding 4/n are influential.
- **Calculate DFFITS for each observation.** Absolute values exceeding 2√(p/n) indicate influential points, where p is the number of parameters.

### Investigate influential points

For each influential observation:

- **Refit your model without the observation.** Do your conclusions change?
- **Determine the source.** Is it a data error, a rare event, or a measurement issue?
- **Decide whether to retain it.** Remove the point only if you have substantive justification (such as a confirmed data error).

Never remove influential observations simply because they're influential. You must have a valid reason based on the data collection process or scientific context.

## Check for Systematic Patterns

### Look for residual patterns

Examine residual plots for patterns that indicate model problems:

- **Plot residuals versus fitted values.** Look for curves, trends, or systematic patterns (should see random scatter).
- **Plot residuals versus predictor variables.** Look for trends (should see random scatter).
- **Plot residuals versus order of data collection.** Look for trends over time (should see random scatter).

### Interpret patterns you find

If you find systematic patterns:

- **Curved pattern:** You may need additional terms (such as quadratic effects) or a transformation.
- **Trend over time:** You may have temporal correlation violating independence.
- **Pattern by predictor:** You may be missing an important interaction term.

## Verify Your Decisions

### Confirm your pre-modeling choices

Use residual diagnostics to verify decisions you made during pre-modeling EDA:

- **Did transformation help?** Compare residual plots before and after transformation.
- **Is Welch's ANOVA needed?** Confirm that residual variance differs substantially across groups.
- **Are influential outliers problematic?** Verify whether removing them changes your conclusions.

### Make final adjustments

Based on your post-modeling diagnostics:

- **Refit if needed.** If diagnostics reveal problems, adjust your model and recheck.
- **Document your process.** Note any adjustments you made and why.
- **Verify robustness.** Consider sensitivity analyses if you're uncertain about specific decisions.

## Report Your Diagnostics

### Document key findings

Include these elements in your methods or results:

- Which diagnostic plots you created
- Results of influence diagnostics (Cook's distance, DFFITS)
- Any violations you found and how you addressed them
- Justification for any observations you removed
- Sensitivity analyses if you made controversial decisions

### Include representative visualizations

Add one or two key diagnostic plots to your results:

- Residual versus fitted plot (shows HOV and patterns)
- QQ plot of residuals (shows normality)

You don't need to include all diagnostic plots—just enough to demonstrate that you checked assumptions thoroughly.
