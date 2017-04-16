
# OLS
tidy_ols = function(ols) ols %>% tidy %>% mutate(p = Sign(p.value)) %>% dplyr::select(term, B = round(estimate), SE = round(std.error), p) %>% mutate(B = round(B,1), SE = round(SE,1))

# Logit
tidy_glm = function(x) x %>% tidy(exponentiate = T) %>% mutate(OR = round(estimate, 3), se = round(std.error, 3), p = Sign(p.value)) %>% select(term, OR, se, p)

# standardised coeffe
tidy_ols_standardised = function(x){

  # must install this package #

  lmtidy = tidy(x) %>% mutate(term, estimate = round(estimate, 2), std.error = round(std.error, 2), p.value = Signif(p.value)) %>% dplyr::select(term, estimate, std.error, p.value)

  lsd = x %>% standardCoefs() %>% as.data.frame()
  lsd$term = rownames(lsd)
  lsd = lsd[,c('term','beta')]
  lsd$beta = round(lsd$beta, 2)

  # join #
  lmtidymodel = left_join( lmtidy, lsd, by = 'term')
  lmtidymodel = lmtidymodel %>% dplyr::select(term, estimate, std.error, beta, p.value)

  return(lmtidymodel)
}
