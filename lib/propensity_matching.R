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

#function returns the lm fit using treatment-covariate interactions
get_ATE_using_treatment_covariate_interactions <- function(matches_obj, num_covs){
  
  #Estimating a covariate-adjusted marginal effect
  #with treatment-covariate interactions
  #Create a new dataset for centered variables
  md_cen <- matches_obj
  
  
  covs_to_center <- seq(1, num_covs, by=1)
  covs_to_center=paste0("V",covs_to_center)
  

  md_cen[covs_to_center] <- scale(matches_obj[covs_to_center], 
                                  scale = FALSE)
  
  
  dynamic_formula <- paste(paste("Y ~ A *(", paste(covs_to_center, collapse="+")),")")
  
  
  #Fit the model with every covariate interacting with treatment
  fit2 <- lm(dynamic_formula,
             data = md_cen, weights = weights)
  return(fit2)
}