# cross-validation

cv.function <- function(features, labels, K, cp, reweight = FALSE){
  
  
  # features: the covariates in the data: V1-VP
  # labels: the treatment class in the data: A
  # K: number of fold for cross-validation
  # cp: complexity hyperparameter for decision trees
  # reweight: boolean to determine if weights need to change
  
  n <- dim(features)[1]
  n.fold <- round(n/K, 0)
  s <- sample(n) %% K + 1
  cv.error <- rep(NA, K)
  cv.AUC <- rep(NA, K)
  
  for (i in 1:K){
    ## create features and labels for train/test
    feature_train_cv <- features[s != i,]
    feature_test_cv <- features[s == i,]
    label_train_cv <- labels[s != i]
    label_test_cv <- labels[s == i]
    
    ## sample reweighting
    weight_train_cv <- rep(NA, length(label_train_cv))
    weight_test_cv <- rep(NA, length(label_test_cv))
    for (v in unique(labels)){
      weight_train_cv[label_train_cv == v] = 0.5 * length(label_train_cv) / length(label_train_cv[label_train_cv == v])
      weight_test_cv[label_test_cv == v] = 0.5 * length(label_test_cv) / length(label_test_cv[label_test_cv == v])
    }
    
    ## model training
    if (reweight){
      model_train <- train(feature_train_cv, label_train_cv, w = weight_train_cv, cp)
    } else {
      model_train <- train(feature_train_cv, label_train_cv, w = NULL, cp)
    }
    
    ## make predictions
    prob_pred <- test(model_train, feature_test_cv, pred.type = "prob")[, 2] # index here 
    label_pred <- ifelse(prob_pred >= 0.5, 1, 0)
  
    cv.error[i] <- 1 - sum(weight_test_cv * (label_pred == label_test_cv)) / sum(weight_test_cv)
    tpr.fpr <- WeightedROC(prob_pred, label_test_cv, weight_test_cv)
    cv.AUC[i] <- WeightedAUC(tpr.fpr)
  }
  return(c(mean(cv.error), sd(cv.error), mean(cv.AUC), sd(cv.AUC)))
}



#features = df_high[, -1:-2]
#labels = df_high[, 2]
#reweight = TRUE
#cp = 0.05
#maxdepth = 10
