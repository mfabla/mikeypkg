#' T Test Calculator
#' 
#' This funtion is a T Test Calculator. Original script found at:
#' https://stats.stackexchange.com/questions/30394/how-to-perform-two-sample-t-tests-in-r-by-inputting-sample-statistics-rather-tha
#' 
#' @param df enter desired dataframe 
#' @param vars variables for 
#' @param mean1 mean for sample 1
#' @param std1 std for sample 1
#' @param n1 size of sample 1
#' @param mean2 mean for sample 2
#' @param std2 std for sample 2
#' @param n2 size of sample 2
#' @param m0 the null value for the difference in means to be tested for. Default is 0.
#' @param equal.variance whether or not to assume equal variance. Default is FALSE.
#' @import stats
#' @note Non equal variance is default. To change to equal variance assume, enter equal.varance = TRUE. 
#' @return T=test outputs: 'Difference of means', 'Std Error', 't value', and 'p-value'. 
#' @export
#' @examples 
#' ttest_calc(21,2,100, 25, 5, 100)

ttest_calc <- function(mean1, std1, n1, mean2, std2, n2, m0 = 0, equal.variance = FALSE){
  if( equal.variance==FALSE ) {
      se <- sqrt( (std1^2/n1) + (std2^2/n2) )
      # welch-satterthwaite df
      df <- ( (std1^2/n1 + std2^2/n2)^2 )/( (std1^2/n1)^2/(n1-1) + (std2^2/n2)^2/(n2-1) )
    } 
  else{
      # pooled standard deviation, scaled by the sample sizes
      se <- sqrt( (1/n1 + 1/n2) * ((n1-1)*std1^2 + (n2-1)*std2^2)/(n1+n2-2) ) 
      df <- n1+n2-2
    }      
  t <- (mean1-mean2-m0)/se 
  dat <- c(mean1-mean2, se, t, 2*stats::pt(-abs(t),df))    
  names(dat) <- c("Difference of means", "Std Error", "t", "p-value")
  dat <- sapply(dat, function(x) round(x, 4))
  return(dat) 
  }