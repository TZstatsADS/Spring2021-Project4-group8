train <- function(features, labels, w = NULL, cp){
  
  # features: the covariates in the data: V1-VP
  # labels: the treatment class in the data: A
  # w: weights of the data due to imbalanced classes
  # cp: complexity hyperparameter for decision trees
  
  labels <- as.factor(labels)
  model <- rpart(labels ~ .,
                 method = "class",
                 weights = w,
                 data = as.data.frame(cbind(features, labels)), 
                 
                 cp = cp, # hyperparameter 1
                 )
  return(model)
}




# feature_train_cv, label_train_cv, w = weight_train_cv, cp, maxdepth

#part(label_train_cv ~ .,distribution = "bernoulli",
#     weights = w, data = as.data.frame(cbind(feature_train_cv, label_train_cv)), 
#     cp = cp, maxdepth = maxdepth)