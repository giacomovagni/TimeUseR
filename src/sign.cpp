#include <Rcpp.h>
using namespace Rcpp;

// Below is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar)

// For more on using Rcpp click the Help button on the editor toolbar

// [[Rcpp::export]]
CharacterVector Signif(NumericVector x) {
  
  int len = x.size(); 
   CharacterVector mat(len); 
  
  for (int i = 1; i < len; i++) {
    if(x[i] < 0.5 & x[i] > 0.01){
      mat[i] = "*"; 
    }
      if(x[i] < 0.01 & x[i] > 0.001){
      mat[i] = "**"; 
    }
  
     if(x[i] < 0.001){
      mat[i] = "***"; 
    }
  }
  
return(mat); 
}
