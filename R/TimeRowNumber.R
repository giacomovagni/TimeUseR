
col.number <- function(df){
  mat <- matrix(nrow=1,ncol=ncol(df))
  mat[1,] <- names(df)
  print(mat)
}

