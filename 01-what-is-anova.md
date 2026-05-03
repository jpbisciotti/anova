## Core Purpose of ANOVA

Use ANOVA to answer questions such as:

- Do treatment groups differ in mean response? (omnibus)
- Does mean outcome vary across groups? (effects)
- Do combinations of groups produce different average results? (contrasts)

## Generally, what is ANOVA 

ANOVA (analysis of variance) is a structured statistical *framework* that *compares* two or more groups using *functions*. 

From the above-mentioned definition, we explain in sections below what is meant by: 
- "Functions"
- "Framework"
- "Compare"

However, before we explain those, we cover: 
- The common definition of ANOVA (less abstract than definition above)
- Fundamental requirements for ANOVA 

## Often, what is ANOVA

ANOVA often is introduced as "a test to compare the *means* of two or more groups", which technically is true because ANOVA *can* be used to compare group means. However, this definition may be narrow and misleading because, more generally, ANOVA can be used to compare groups values for any of the following conditional functions: 

| Model               | Function               | Compares          |
|---------------------|------------------------|-------------------|
| Linear regression   | E(Y\|X=x) = Xβ         | Arithmetic means  |
| Logistic regression | logit(E(Y\|X=x)) = Xβ  | Proportions (%)   |
| Quantile regression | Q_τ(Y\|X=x) = Xβ       | Medians/quantiles |
| Cox regression      | λ(t\|X) = λ₀(t)·exp(Xβ) | Hazards           |

The comparison of *means* is just one application (the most common) of the general ANOVA framework. 

*Clarification about logistic regression comparing proportions: Logistic regression compares log-odds on its native scale, proportions are recovered by back-transformation.* 

## Fundamental Requirements for ANOVA

An ANOVA model design requires:

- A numerical response 
- Categorical predictors (factors)
- Optional numerical control variables (covariates)

Note about the above-mentioned requirements: 
- They are short list (i.e., fundamental)
- They have exceptions (e.g., MANOVA for multiple responses, ...)

## What is meant by "Function"

Consider the rate of success for individuals who received a treatment: 
- The rate of success is the *function*
- A treatment is a *group* 

For a linear model, the *mean function* is calculated for each group: 
- The categorical predictors are also known as *factors*
- The factors contain groups known as *levels*
- The levels have a *conditional distribution*

A function calculated for each group is a conditional function with a conditional distribution, characterized by shape, center, and spread.

The term "function" collapses model-specific terms: 

| Model               | Conditional Function      | 
|---------------------|---------------------------|
| Linear regression   | conditional mean function |
| Logistic regression | link function             | 
| Quantile regression | quantile function         |
| Cox regression      | hazard function           | 

## What is meant by "Framework"

ANOVA is a structure statistical framework, which may include these steps: 
- Start with a model that represents how variables may relate
- From a model, get and interpret coefficients that quantitatively describe groups
- From coefficients, get the condition distributions of the model function (e.g., the group means)
- From group means, perform comparison (e.g., effects, contrasts)

## What is meant by "Compare"

ANOVA is used to compare groups, which may involve: 
- Getting the difference between group means (i.e., effects)
- Comparing specific groups or combinations of groups (i.e., contrasts)

## How ANOVA works in a linear model setting

ANOVA compares groups by partitioning the total variation in your data into parts: 
- *between-group variation* for how far each group's mean sits from the overall mean
- *within-group variation* for how far each individual point sits from its own group's mean

The split tells you whether group differences are noise or not.
- Large between-group, small within-group → groups likely differ
- Small between-group, large within-group → groups likely don't differ

Even though variance-partitioning is specific to the linear-model setting, comparison of groups using effects and contrasts is portable across model families, .
