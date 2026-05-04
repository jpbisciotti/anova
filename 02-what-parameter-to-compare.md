## What parameter do you want to compare?

Your research question decides what you compare. Pick the parameter before you pick a method.

The ANOVA framework handles four parameters: 
- means
- proportions
- medians
- hazards

Two other parameters sit outside the framework: 
- full distribution
- stochastic ordering

This document covers all six.

## Inside the ANOVA framework

The framework compares groups using a model-specific function. The function changes with the model. The workflow stays the same.

### Comparing means

You want to know if average values differ.

- Example: "Does Drug A reduce pain more than Drug B on average?"
- Method: linear regression
- Function compared: conditional mean

This is the most common case. Most people meet ANOVA here first.

### Comparing proportions

You want to know if success rates differ.

- Example: "Do patients on Drug A recover at a higher rate than patients on Drug B?"
- Method: logistic regression
- Function compared: log-odds (you report odds ratios or back-transformed proportions)

### Comparing medians or other quantiles

You care about the middle value, or another point in the distribution, rather than the mean.

- Example: "What's the typical hospital stay for this procedure?"
- Method: quantile regression
- Function compared: conditional quantile

Use this when the mean misleads, for example, when stay length is skewed by long outliers.

### Comparing hazards

You want to know if one group reaches an event faster than another over time.

- Example: "Does Drug A delay disease progression more than Drug B?"
- Method: Cox regression
- Function compared: hazard (you report hazard ratios)

## Outside the ANOVA framework

Two questions don't fit the framework. They compare groups, but not through a single conditional function.

### Comparing entire distributions

You want to know if groups differ in any way: shape, spread, or center.

- Example: "Are these two processes producing different output distributions?"
- Methods: Kolmogorov-Smirnov, Cramér-von Mises

These tests compare full distributions, not one summary of them.

### Testing stochastic ordering

You want to know if one group tends to produce higher values than another.

- Example: "Do patients on Drug A tend to report better pain relief than patients on Drug B?"
- Method: Mann-Whitney

This tests a tendency, not a specific parameter. (It is sometimes mislabel it as a median test.)
