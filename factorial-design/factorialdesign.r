print('Factorial design')

data_panel = read.csv('your/path/data.csv') 
observations_per_treatment = 4                    # observations per treatment

print(data_panel)

response = c(t(as.matrix(data_panel))) # response data
first_factor = c("Item1", "Item2", "Item3") # 1st factor levels 
second_factor = c("East", "West")            # 2nd factor levels 
first_factor_length = length(first_factor)          # number of 1st factors
second_factor_length = length(second_factor)          # number of 2nd factors

  
tm1 = gl(first_factor_length, 1, (observations_per_treatment * first_factor_length * second_factor_length), factor(first_factor)) 
tm2 = gl(second_factor_length, (observations_per_treatment * first_factor_length), (observations_per_treatment * first_factor_length * second_factor_length), factor(second_factor)) 
anova = aov(response ~ tm1 * tm2)  # include interaction 
summary(anova)

