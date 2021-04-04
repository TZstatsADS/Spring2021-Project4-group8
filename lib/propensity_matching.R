#function returns a matchit object
#wrapper for matchit library calls
get_match_obj <- function(Any_Dim_Data, propensity_score=NULL){
  
  if (!is.null(propensity_score)){
    # we received an external propensity score, so we use it.
    matchit.out <- matchit(A ~ . - Y, data = Any_Dim_Data, distance = propensity_score, estimand = "ATE", method = "full", verbose = TRUE)
    
  } else {
    matchit.out <- matchit(A ~ . - Y, data = Any_Dim_Data, distance = "rpart", verbose = TRUE, estimand = "ATE", method = "full")
  }
  

  return(matchit.out)
  
}