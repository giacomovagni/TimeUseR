
# OLS 
tidy_ols = function(ols) ols %>% tidy %>% mutate(p = Sign(p.value)) %>% dplyr::select(term, B = round(estimate), SE = round(std.error), p) %>% mutate(B = round(B,1), SE = round(SE,1)) 

# Logit
tidy_glm = function(x) x %>% tidy(exponentiate = T) %>% mutate(OR = round(estimate, 3), se = round(std.error, 3), p = Sign(p.value)) %>% select(term, OR, se, p)
