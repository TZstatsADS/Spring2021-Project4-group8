test <- function(model, features, pred.type){
  
  # model: trained model from train library
  # features: the covariates in the data: V1-VP
  # pred.type: type of prediction function output e.g. class, probability
  
  res <- predict(model, newdata = data.frame(features), type = pred.type)
  
  return(res)
}

