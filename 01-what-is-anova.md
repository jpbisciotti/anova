## About this document

Modern statistics has moved toward unifying regression, ANOVA, and GLMs under one framework. This document introduces ANOVA in that broader context. It's written for intermediate statistics learners. Worked examples follow in later documents.

## Core purpose of ANOVA

Use ANOVA to answer questions such as:

- Do treatment groups differ in mean response? (omnibus)
- Does mean outcome vary across groups? (effects)
- Do combinations of groups produce different average results? (contrasts)

## Fundamental requirements

An ANOVA model design requires:

- A numerical response
- Categorical predictors (factors)
- Optional numerical control variables (covariates)

This list is intentionally short, and exceptions exist, for example, MANOVA handles multiple responses.

## What is ANOVA?

ANOVA (analysis of variance) is a structured statistical *framework* that *compares* two or more groups using *functions*.

Three terms in this definition need explanation:

- *Function*
- *Framework*
- *Compare*

The next three sections cover each one.

### Function: the model-specific quantity you compare

Consider the rate of success for individuals who received a treatment:

- The rate of success is the *function*
- A treatment is a *group*

For a linear model, the *mean function* is calculated for each group:

- The categorical predictors are also known as *factors*
- The factors contain groups known as *levels*
- The levels have a *conditional distribution*

A function calculated for each group is a conditional function with a conditional distribution, characterized by shape, center, and spread.

The term "function" collapses model-specific terms:

| Model               | Conditional function      |
|---------------------|---------------------------|
| Linear regression   | Conditional mean function |
| Logistic regression | Link function             |
| Quantile regression | Quantile function         |
| Cox regression      | Hazard function           |

### Framework: the four-step workflow

ANOVA follows these steps:

1. Start with a model that represents how variables may relate.
2. From the model, get and interpret coefficients that quantitatively describe groups.
3. From the coefficients, get the conditional distributions of the model function (for example, the group means).
4. From the group means, perform comparisons (effects and contrasts).

### Compare: effects and contrasts

ANOVA compares groups in two main ways:

- Differences between group means (effects)
- Specific comparisons between groups or combinations of groups (contrasts)

#### Effect

An **effect** is the difference in the model's function between two groups.

In a linear model, an effect is the difference in group means. For example, if Drug A produces a mean blood pressure of 130 and Drug B produces 125, the effect of switching from A to B is -5.

The function changes with the model, but the idea stays the same:

| Model               | An effect is the difference in...   |
|---------------------|-------------------------------------|
| Linear regression   | Group means                         |
| Logistic regression | Log-odds (reported as odds ratios)  |
| Quantile regression | Group medians or quantiles          |
| Cox regression      | Log-hazards (reported as hazard ratios) |

You can compute an effect for one factor (the effect of Drug) or for an interaction (the effect of Drug depends on Age Group).

#### Contrast

A **contrast** is a specific comparison you choose to make between groups.

An effect is one kind of contrast: the simplest kind, comparing two groups. Contrasts let you ask sharper questions:

- Does Drug A differ from Drug B? (a simple two-group contrast)
- Does the average of Drugs A and B differ from Placebo? (a combined-group contrast)
- Does the gap between Drug A and Placebo differ from the gap between Drug B and Placebo? (a contrast of contrasts)

You build a contrast by assigning weights to each group. The weights must sum to zero. Some examples for three groups (A, B, Placebo):

| Question                       | Weight on A | Weight on B | Weight on Placebo |
|--------------------------------|-------------|-------------|-------------------|
| A vs. Placebo                  | +1          | 0           | −1                |
| B vs. Placebo                  | 0           | +1          | −1                |
| Average of A and B vs. Placebo | +0.5        | +0.5        | −1                |

The contrast machinery works the same way across model families. Only the function being compared changes.

#### How effects and contrasts relate

An effect is what you measure. A contrast is how you specify the comparison. Every effect is a contrast, but not every contrast is what people would casually call an effect.

## A narrow definition of ANOVA

ANOVA often is introduced as "a test to compare the *means* of two or more groups". That's technically true, because ANOVA *can* compare group means. But the definition is narrow and potentially misleading. ANOVA can compare groups on any of the following conditional functions:

| Model               | Function                | Compares          |
|---------------------|-------------------------|-------------------|
| Linear regression   | E(Y\|X=x) = Xβ          | Arithmetic means  |
| Logistic regression | logit(E(Y\|X=x)) = Xβ   | Proportions (%)   |
| Quantile regression | Q_τ(Y\|X=x) = Xβ        | Medians/quantiles |
| Cox regression      | λ(t\|X) = λ₀(t)·exp(Xβ) | Hazard ratios     |

Two clarifications about the "Compares" column:

- Logistic regression compares log-odds on its native scale. Proportions come from back-transformation.
- Cox regression compares hazards on a log scale. Hazard ratios are what you usually report.

The comparison of *means* is just one application of the general ANOVA framework (the most common one).

## How ANOVA works in a linear model setting

ANOVA compares groups by partitioning the total variation in your data into parts:

- *Between-group variation*: how far each group's mean sits from the overall mean
- *Within-group variation*: how far each individual point sits from its own group's mean

The split tells you whether group differences are noise:

- Large between-group, small within-group → groups likely differ
- Small between-group, large within-group → groups likely don't differ

## ANOVA in a linear model setting ports across model families

Variance partitioning is specific to the linear-model setting. Comparison of groups using effects and contrasts is portable across model families. Later documents show this with worked examples.
