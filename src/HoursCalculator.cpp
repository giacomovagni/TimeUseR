#include <Rcpp.h>
using namespace Rcpp;

// Below is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar)

// For more on using Rcpp click the Help button on the editor toolbar

// [[Rcpp::export]]
NumericVector TimeHoursCalCpp1(IntegerVector x) {
  
  int h = x.size();
  double m = x.size();

  NumericVector hour = x.size();
  NumericVector min = x.size();

  int len = x.size();

  for(int i = 0; i < len; ++i) {
    h = (x[i] / 60); 
    hour[i] = h; 
  }

  for(int i = 0; i < len; ++i) {
    m = (x[i] % 60); 
    min[i] = m; 
  }
  
// NumericVector hour = (x / 60) ; 
//  NumericVector minutes = (x % 60) ; 

  for(int i = 0; i < len; ++i) {
    if( min[i] < 10 & hour[i] < 10){
       Rcout << "0" << hour[i] << "h0" << min[i] << std::endl; 
    }
        if( min[i] < 10 & hour[i] > 10){
       Rcout << hour[i] << "h0" << min[i] << std::endl; 
    }
    if( min[i] > 9 & hour[i] > 10 ){
       Rcout << hour[i] << "h" << min[i] << std::endl; 
    }
  }

  return min;  
}


