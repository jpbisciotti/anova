# Statistical Tests: A Practitioner Guide to Comparing Groups

## The Core Problem

Standard non-parametric tests (Mann-Whitney, Kruskal-Wallis) don't test means or medians. They test "stochastic superiority": whether one group tends to have higher values overall. This is sensitive to differences in location, spread, and shape all mixed together.

**When you report p < 0.05, you cannot explain what actually differs between your groups.**

-----

## What is "Stochastic Superiority"?

Imagine comparing pain relief times between Drug A and Drug B using Mann-Whitney:

**Scenario 1: Different means**

- Drug A: mean = 50 min (SD = 5)
- Drug B: mean = 40 min (SD = 5)
- Result: Significant difference (p = 0.001)
- You might think: "Drug A provides 10 minutes more relief on average"
- What the test actually says: "A randomly selected person on Drug A tends to have longer relief than someone on Drug B"

**Scenario 2: Same means, different spreads**

- Drug A: mean = 45 min (SD = 20)
- Drug B: mean = 45 min (SD = 5)
- Result: Could also be significant (p = 0.03)
- Problem: Means are identical. The test detected the difference in variability, not location
- But you'd report: "Groups differ significantly", which is misleading

**The problem:** You can't tell from the p-value whether groups differ in average values, variability, or shape. This makes results nearly impossible to interpret or communicate to non-statisticians.

-----

## Why Changing Your Null Hypothesis Matters

**Original research question:** "Do these treatments produce different average outcomes?"

**What happens when you switch to non-parametric tests:**

- **Your null hypothesis changes** from H0: mu1 = mu2(equal means) to H0: P(X₁ > X₂) = 0.5 (no stochastic superiority)
- **Your results answer a different question** than you asked
- **You can't report effect sizes** in the original units (e.g., "10 mg/dL difference")
- **You can't make predictions** like "we expect the new treatment to increase scores by 5 points"
- **Stakeholders get confused** when you say "groups differ" but can't explain how

-----

## Practical Decision Workflow

### Step 1: Check Your Data and Assumptions First

Always start by plotting your data and checking assumptions. Don't wait until after running tests.

- Create boxplots, histograms, Q-Q plots
- Check normality with Shapiro-Wilk test and visual inspection
- Check equal variance with Levene's test
- Look for outliers and influential points
- Check independence (especially important for time series or clustered data)

### Step 2: If Assumptions Hold

Use standard parametric tests (t-test, ANOVA). Report means, confidence intervals, and effect sizes.

### Step 3: If Normality Fails But You Want to Compare Means

**Option A: Transform Your Data**

- Try log, square root, or Box-Cox transformation
- Check if transformation makes data more normal
- You can back-transform means and confidence intervals
- You cannot back-transform differences between means
- Example: "After log transformation, estimated mean is 4.02 days (95% CI: [3.14, 5.08])"

**Option B: Use Permutation/Bootstrap Tests**

- Tests means without assuming normality
- Keeps your original hypothesis about means
- Can report differences like "Group A mean is 10 units higher than Group B"

### Step 4: If Unequal Variances But Normality OK

- Use Welch's t-test or Welch's ANOVA
- Still tests means, just doesn't assume equal variances
- SAS: use PROC MIXED with GROUP option to model heterogeneous variances

### Step 5: If You Want to Compare Medians Instead

Use quantile regression. This is a deliberate choice to change your question from means to medians.

Report it clearly: "We compared medians because [reason]. Median for Group A was 45 (95% CI: [40, 50])"

### Step 6: Only Use Rank-Based Tests If You Must

If transformations don't work, variances are heterogeneous, data are severely non-normal, and your audience will accept vague conclusions:

- Use Mann-Whitney, Kruskal-Wallis, etc.
- **Report honestly:** "We found evidence that distributions differ (p = 0.01), but cannot specify whether this reflects differences in central tendency, variability, or shape"
- Consider supplementing with descriptive statistics and plots

-----

## Comparison of Statistical Approaches

### 1. Standard Non-Parametric Tests (Use Only as Last Resort)

**Rank-Based Tests**

- Examples: Mann-Whitney U, Wilcoxon, Kruskal-Wallis, Spearman
- What it tests: Stochastic superiority
- What you can conclude: "Groups differ somehow" (cannot specify whether means, medians, or spreads differ)
- Key limitation: Uninterpretable (could be location, spread, shape, or all three)
- When to use: Rarely (only when other options fail and vague conclusions acceptable)

### 2. Distribution Comparison Tests

**CDF-Based Tests**

- Examples: Kolmogorov-Smirnov, Cramer-von Mises, Anderson-Darling
- What it tests: Whether entire distributions are identical
- What you can conclude: "Distributions differ" (no information about how)
- Key limitation: Tells you *that* groups differ, not *how*
- When to use: When you need to test if distributions are identical overall

### 3. Quantile-Based Methods (Changes Your Question)

**Median Tests**

- Examples: Quantile regression, Mood-Brown test
- What it tests: Whether medians differ
- What you can conclude: "Medians differ by X units" (clear interpretation)
- Key limitation: Tests medians, not means (different question than original hypothesis)
- When to use: When median is genuinely your parameter of interest

### 4. Data Transformation (Preserves Question About Means)

**Transform Then Test**

- Examples: Log, sqrt, Box-Cox + t-test/ANOVA
- What it tests: Whether means differ (on transformed scale)
- What you can conclude: "After transformation, mean A exceeds B" (Can back-transform estimates and CIs)
- Key limitation: Cannot back-transform differences (must interpret on original scale carefully)
- When to use: First choice when normality fails

### 5. Distribution-Free Methods That Preserve Your Hypothesis (Best Options)

**Permutation/Bootstrap Tests**

- Examples: Permutation Welch t-test, Bootstrap ANOVA
- What it tests: Whether means differ
- What you can conclude: "Mean of A exceeds B by X units (95% CI: [L, U])" (same as parametric tests)
- Key limitation: None (tests original hypothesis)
- When to use: When transformation doesn't help or isn't appropriate

**Welch's Test/ANOVA**

- For unequal variances
- What it tests: Whether means differ
- What you can conclude: "Mean difference is X units"
- Key limitation: Still assumes normality (but robust to variance inequality)
- When to use: When variances unequal but data reasonably normal

**GEE (Generalized Estimating Equations)**

- What it tests: Whether means differ
- What you can conclude: "Mean difference is X units" (Robust to correlation and distribution)
- Key limitation: Requires larger sample sizes
- When to use: For correlated/clustered data with violations

-----

## Complete Analysis Checklist

### Before Running Any Test

- State your research question and hypothesis clearly
- Identify what parameter you want to compare (mean, median, distribution)
- Plot your data (boxplots, histograms, Q-Q plots)
- Check normality (Shapiro-Wilk + visual inspection)
- Check equal variances (Levene's test + comparison of SDs)
- Check for outliers and influential points
- Verify independence assumption
- Document any violations and your planned approach

### What to Report

- Sample sizes for all groups
- Descriptive statistics (means, SDs, medians, ranges) by group
- Results of assumption checks (test statistics and p-values)
- How you addressed violations (transformation, alternative test, etc.)
- Test statistic, degrees of freedom, and exact p-value
- **Effect sizes** (Cohen's d, eta-squared, omega-squared) not just p-values
- **Confidence intervals** for all important differences
- Interpretation in context: "Group A scored 10 points higher (95% CI: [5, 15])"
- Statement of practical significance alongside statistical significance

-----

## Common Mistakes to Avoid

- **Don't automatically use non-parametric tests** just because sample size is small or data "look non-normal". Check assumptions systematically first.
- **Don't ignore assumption violations** and proceed with standard tests anyway.
- **Don't switch to rank-based tests** without understanding you're changing your research question.
- **Don't report only p-values** without effect sizes and confidence intervals.
- **Don't confuse statistical significance with practical significance** (a p-value of 0.001 doesn't mean the effect is large or important)
- **Don't forget that transformation is often better** than switching to non-parametric tests.
- **Don't report "the groups differed significantly"** from a rank test without acknowledging you don't know how they differ.
- **Don't use post-hoc power analysis** after non-significant results (this is not meaningful)

-----

## Quick Decision Guide

**What do you want to compare?**

### Means (most common)

- Assumptions met? Standard t-test or ANOVA
- Unequal variances only? Welch's t-test/ANOVA
- Non-normality? Try transformation first, then permutation/bootstrap
- Correlated data? GEE or mixed models

### Medians (deliberate choice)

- Use quantile regression
- Report: "We chose to compare medians because [reason]"

### "Something differs" (vague conclusion acceptable)

- Use CDF-based tests (KS, CvM, AD) to test if distributions differ
- Report: "Distributions differ, but we cannot specify how"

### Last resort: Stochastic superiority

- Only when all else fails and stakeholders accept vague results
- Use Mann-Whitney or Kruskal-Wallis
- Report honestly about interpretation limitations

-----

## Key Principles to Remember

**All statistical models involve assumptions, and no model is perfectly correct.** The goal is to find a model that is a good enough approximation to answer your research question reliably.

**Always check assumptions**. This is as crucial as running the test itself. If assumptions fail, use appropriate alternatives that preserve your original research question whenever possible.

**Report completely**. Sample sizes, descriptive statistics, assumption checks, test results, effect sizes, and confidence intervals. Statistical significance alone doesn't tell the full story.

**Focus on practical significance**. A statistically significant result may not be practically meaningful. Always interpret results in the context of your research question and field.

-----

## Example: Complete Reporting

**Good example of complete reporting:**

We compared mean pain relief duration between Drug A (n=50) and Drug B (n=48). Mean relief was 45.2 minutes (SD=12.3) for Drug A and 38.7 minutes (SD=11.8) for Drug B.

Shapiro-Wilk tests indicated no significant deviation from normality (Drug A: W=0.98, p=0.61; Drug B: W=0.97, p=0.43). Levene's test showed homogeneity of variance (F=0.24, p=0.63).

An independent samples t-test showed that Drug A provided significantly longer relief than Drug B (t(96)=2.64, p=0.010, Cohen's d=0.53). The mean difference was 6.5 minutes (95% CI: [1.6, 11.4]).

This represents a medium effect size and is clinically meaningful, as an additional 6-7 minutes of relief is important for patient comfort.

**Why this is good:**

- States sample sizes
- Reports descriptive statistics
- Documents assumption checking
- Provides test statistic, df, and exact p-value
- Reports effect size (Cohen's d)
- Includes confidence interval for the difference
- Interprets practical significance

-----

## Resources for Further Learning

**For assumption checking:**

- Visual diagnostics are often more informative than formal tests
- Q-Q plots for normality
- Residual plots for homoscedasticity
- Index plots for independence

**For transformation:**

- Box-Cox family for finding optimal transformation
- Log transformation for right-skewed data
- Square root for count data
- Reciprocal for reaction times

**For effect sizes:**

- Cohen's d for differences between means
- Eta-squared or omega-squared for ANOVA
- Confidence intervals around effect sizes when possible

**For power analysis:**

- Conduct power analysis during study design, not after
- Use pilot data to estimate effect sizes
- Plan for adequate sample size to detect meaningful effects
