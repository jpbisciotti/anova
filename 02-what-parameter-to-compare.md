## What parameter you want to compare

Consider your research question and be explicit about what parameter you want to compare:

**Comparing means (most common)**
- You want to know if average values differ
- Example: "Does Drug A reduce pain more than Drug B on average?"
- Tests: t-test (2 levels), ANOVA (2+ levels), or alternatives when assumptions fail

**Comparing medians (deliberate choice)**
- You specifically care about the middle value, not the mean
- Example: "What's the typical hospital stay for this procedure?"
- Tests: tests with quantile regression

**Comparing entire distributions**
- You want to know if groups differ in any way
- Example: "Are these two processes producing different output distributions?"
- Tests: Kolmogorov-Smirnov, Cramér-von Mises

**Testing stochastic ordering**
- You want to know if one group tends to have higher values
- Example: "Is pain relief consistently better with Drug A?"
- Tests: Mann-Whitney
