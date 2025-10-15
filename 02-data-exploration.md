## Data Exploration

Before running ANOVA, examine your data visually. 

Always plot the data to provide context that p-values alone cannot. 

Document all EDA decisions and findings before proceeding to formal testing. 

### Sample size

Assess counts
- Are groups balanced or unbalanced (i.e., affects power analysis, Type II/III SS)
- Are there major imbalances (e.g, 4x max:min)
- Are any groups too small (e.g., less than 10)
- Is the total sample size enough (i.e., power analysis)

### Central Tendency

Compare means across groups
- Do means appear similar or different?
- Do medians appear similar or different?
- Is there a visual separation between groups?
- Is there a practical significance in differences between groups?
- How are relative differences (e.g., one-half, 2x)?
- Which factor levels appear to be driving any observed differences?

### Shape

Assess skewness
- Is the data symmetric or skewed
- Are group means and group medians similar

If the group data is symmetric 
- Is mound-shaped or uniform 
- Are tails thin or thick (i.e., kurtosis)

### Variability

Compare variability across groups
- Is variability similar across groups?
- Is variability wide or narrow?
- Does there appear to be a violation of HOV?
- Are ranges roughly similar or different?
- Are the standard deviations roughly similar (e.g., rough guideline 2:1 max:min)?
- Does one group have both the lowest and highest value (consistent with the Hawthorne effect)? 

### Outliers

Check for outliers
- Do there appear to be outliers in any groups?
- Do outliers appear to be influential outliers or benign as extreme values?

### Interaction plots

Assess interactions
- Two-way (parallel lines = no interaction, crossing = interaction)
- Three-way

### Plots

Raincloud plots can capture: 
- Individual point
- Means
- Spread
- Shape
- Variability
- Outliers

Raincloud plots may include confidence intervals. 

### Remedial measures with transforations

- For Negative Skewness (left-skewed, fewer values at low end), transforming using square, reciprocal, or Box-Cox with appropriate lambda
- For Positive Skewness (right-skewed), consider transforming using log or square root
- Box-Cox may require shift to achieve positive values
- Transforations complicate interpretation (e.g., you're no longer analyzing original units, back-transformation feasibility)

## Major Questions in EDA

- If HOV may be violated, consider Welch's ANOVA. 
- If normality violated + large n, consider ANOVA. 
- If normality violated + small n, consider transformation or non-parametric test. 
- If severe outliers, investigate and consider robust methods. 
