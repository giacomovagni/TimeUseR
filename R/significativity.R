
Sign <- function(pv) symnum(pv, corr = FALSE, na = FALSE,
                            cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1),
                            symbols = c("***", "**", "*", ".", " "))


