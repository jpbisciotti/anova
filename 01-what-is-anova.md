## Core Purpose of ANOVA

Use ANOVA to answer questions such as:

- Do treatment groups differ in mean response?
- Does mean outcome vary across groups?
- Do combinations of groups produce different average results?

## Generally, what is ANOVA 

ANOVA (analysis of variance) is a structured statistical framework that compares two or more groups using (conditional) functions. 

Sections below explain in the above-mentioned definition what is meant by: 
- "Using condition functions"
- "Structured statistical framework"
- "Compare groups"

But first, sections below cover: 
- The common definition of ANOVA (less abstract, more specific/precise than above)
- Requirements for ANOVA 

## Often, what is ANOVA

ANOVA often is introduced as "a test to compare the *means* of two or more groups", which technically is true because ANOVA *can* be used to compare group means. However, this definition is narrow and misleading because, more generally, ANOVA can be used to compare groups values for any of the following (conditional) functions: 

| Model               | Conditional Function  | Compares          |
|---------------------|-----------------------|-------------------|
| Linear regression   | E(Y\|X=x) = Xβ        | Arithmetic means  |
| Logistic regression | logit(E(Y\|X=x)) = Xβ | Proportions (%)   |
| Quantile regression | Q_τ(Y\|X=x) = Xβ      | Medians/quantiles |
| Cox regression      | λ(Y\|X=x) = Xβ        | Hazards           |

The comparison of *means* is just one application (the most common) of the general ANOVA framework. 

## Requirements for ANOVA

An ANOVA model design requires:

- A numerical response 
- Categorical predictors (factors)
- Optional numerical control variables (covariates)

*Note: the above-mentioned requirements have exceptions (e.g., MANOVA for multiple responses, ...)*

## What is meant by "Using Condition Functions"

Consider the rate of success for individuals who received a treatment 
- The rate of success is the function
- Individuals who received a treatment is a group 

A "conditional" function is calculated for each group: 
- The categorical predictors are also known as factors
- The factors contain groups known as levels
- The levels have conditional distributions

*Recall: a distribution is characterized by shape, center, and spread.*

## What is meant by "Structured Statistical Framework"

ANOVA Framework may involve these key steps: 
- Start with a model that represents how variables may relate
- From a model, get and interpret coefficients that quantitatively describe groups
- From coefficients, get the condition distributions of the model function (e.g., the group means)
- From group means, perform comparison (e.g., effects, contrasts)

## What is meant by "Compare Groups"

ANOVA is used to compare groups, which may involve: 
- Getting the difference between group means (effects)
- Comparing specific groups or combinations of groups (contrasts)
