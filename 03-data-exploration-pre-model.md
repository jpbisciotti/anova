# Pre-Modeling ANOVA EDA

## Why Check Your Data Before Modeling

Always examine your data before you run ANOVA. Plots show you patterns that p-values can't reveal. Document what you find before you proceed to formal testing.

## Check Sample Size and Balance

### Assess your group sizes

Verify that your design has adequate power and balanced groups:

- **Are your groups balanced?** Unbalanced designs affect power and the calculation of Type II/III sums of squares.
- **Do you have major imbalances?** Look for maximum-to-minimum ratios exceeding 4:1.
- **Are any groups too small?** Groups with fewer than 10 observations may lack adequate power.
- **Is your total sample size adequate?** Run a power analysis to verify you can detect meaningful effects.

## Check Distributions

### Assess shape within each group

Check whether your data are symmetric or skewed:

- **Is the distribution symmetric or skewed?** Compare means and medians—similar values suggest symmetry.
- **For symmetric data:** Is the shape mound-shaped or uniform? Are the tails thin or thick?
- **For skewed data:** Note the direction (right-skewed = positive skew; left-skewed = negative skew).

### Assess normality within each group

Check whether your data meet the normality assumption:

- **Create QQ plots for each group.** Points falling along the diagonal indicate normality.
- **Compare histogram shapes to a normal distribution.** Look for bell-shaped curves centered on the mean.
- **For small samples:** Assess whether departures are severe enough to matter given your limited data.

Small departures from normality matter less with large sample sizes (Central Limit Theorem). Severe departures with small samples require remedial action.

## Compare Central Tendency

### Assess location differences across groups

Determine whether your groups differ in meaningful ways:

- **How large are differences between means and medians?** Look for both statistical and practical significance.
- **Is separation visually apparent?** Groups should show clear differences if ANOVA will detect them.
- **What's the magnitude of differences?** Consider fold-changes and standardized effect sizes.
- **Which factor levels drive observed differences?** Identify specific groups that appear distinct.

## Compare Variability

### Check spread within groups

Assess how much observations vary within each group:

- **Is variability wide or narrow?** Compare ranges and standard deviations.
- **Are ranges roughly similar across groups?** Similar ranges suggest similar variances.

### Check homogeneity across groups

Verify that the homogeneity of variance (HOV) assumption holds:

- **Do standard deviations appear similar across groups?** Use a rough 2:1 maximum-to-minimum ratio as a guideline.
- **Does any group show both the lowest and highest value?** This pattern may indicate a response to observation (Hawthorne effect) rather than treatment.

### Run formal diagnostics

Test variance equality directly:

- **Run Levene's test or Brown-Forsythe test.** These tests directly assess HOV.
- **Consider sample size effects.** Large samples make tests sensitive to trivial violations. Small samples may miss real violations.

## Identify Outliers

### Find potential outliers

Check for extreme values in any group:

- **Do outliers appear in any groups?** Look for points far from the group center.
- **Are outliers extreme values consistent with the distribution, or are they errors?** Consider whether outliers represent real but rare observations or data entry mistakes.

You'll assess whether these outliers influence your results after you fit your model.

## Verify Independence

### Check that observations are independent

Verify that the independence assumption holds:

- **Were observations collected independently?** Consider whether one observation could affect another.
- **Is there clustering in your design?** Repeated measures or nested designs violate independence.
- **Does temporal or spatial ordering matter?** Sequential observations may be correlated.

If independence is violated, you need mixed models or repeated measures ANOVA rather than standard ANOVA.

## Check for Interactions (Factorial Designs Only)

If you have two or more factors, assess whether they interact:

### Examine two-way interactions

Create interaction plots with one factor on the x-axis and separate lines for each level of the second factor:

- **Parallel lines indicate no interaction.** Factors affect the response independently.
- **Converging lines suggest ordinal interaction.** One factor's effect diminishes at certain levels of the other factor.
- **Crossing lines indicate disordinal interaction.** The direction of one factor's effect reverses depending on the other factor's level.

### Examine three-way interactions

Three-way interactions are difficult to interpret. Create separate two-way interaction plots for each level of the third factor. If the pattern of interaction changes across levels of the third factor, you have a three-way interaction.

Consider simplifying your model or design if three-way interactions appear complex.

## Choose Your Visualizations

### Use plots that show multiple features

**Raincloud plots capture multiple features simultaneously:**

- Individual data points
- Means (or medians)
- Spread (distributions)
- Shape (skewness, kurtosis)
- Variability (ranges, standard deviations)
- Outliers
- Confidence intervals (optional)

**Other useful plots:**

- **Box plots:** Quick comparison of medians, quartiles, and outliers
- **QQ plots:** Normality assessment for each group
- **Interaction plots:** For factorial designs only

Choose plots that efficiently communicate the patterns relevant to your research questions.

## Decide Your Analysis Approach

Use what you found in your EDA to choose the appropriate analysis:

### If HOV is violated

- **Use Welch's ANOVA.** This method adjusts for unequal variances and doesn't assume homogeneity.
- **Consider transformation.** If variance increases with the mean (a common pattern), transformation may help.

### If normality is violated

- **With large n:** Proceed with ANOVA. It's robust to normality violations when sample sizes are adequate (e.g., n > 10 per group).
- **With small n:** Consider transformations or non-parametric tests (such as Kruskal-Wallis).

### If severe outliers exist

- **Investigate first.** Determine whether outliers are errors, rare events, or measurement issues.
- **Consider robust methods.** Trimmed means, Winsorization, or robust ANOVA resist outlier influence.
- **Consider non-parametric tests.** Rank-based tests are insensitive to extreme values.

### If independence is violated

- **Use appropriate models.** Switch to mixed models, repeated measures ANOVA, or multilevel models.
- **Don't proceed with standard ANOVA.** Violations of independence invalidate standard error calculations.

## Transform Data if Needed

### Apply transformations to skewed data

Transform skewed data to better meet assumptions:

**For positive skewness (right-skewed data):**

- **Log transformation:** Works well for moderate to strong positive skew
- **Square root transformation:** Works well for mild positive skew
- **Box-Cox transformation:** Finds the optimal transformation parameter (lambda)

**For negative skewness (left-skewed data):**

- **Square transformation:** Works well for moderate negative skew
- **Reciprocal transformation:** Works well for strong negative skew
- **Box-Cox transformation:** May require shifting data to achieve positive values

**For any skewness:**

- **Rank transformation:** Converts data to ranks (equivalent to a non-parametric approach)

### Understand transformation trade-offs

**Interpretation becomes complex:**

- You're no longer analyzing original measurement units
- Back-transformation may not be feasible for all inferences
- Means of transformed data don't equal transformed means

**When transformations fail:**

- **Consider robust ANOVA methods.** These resist violations without transformation.
- **Consider permutation tests.** These make no distributional assumptions.
- **Consider non-parametric alternatives.** Kruskal-Wallis and similar tests work on ranks.

## Know Which Assumptions Matter Most

Not all assumption violations matter equally:

1. **Independence matters most.** Violations invalidate your entire analysis.
2. **HOV matters moderately.** Welch's ANOVA easily handles violations.
3. **Normality matters least.** ANOVA is robust with adequate sample sizes.

Don't let minor normality violations with n > 10 per group stop you from using ANOVA.
