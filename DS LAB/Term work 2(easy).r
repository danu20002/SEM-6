library(KernelKnn)
data(ionosphere, package = 'KernelKnn')
ionosphere = ionosphere[, -2]
X = scale(ionosphere[, -c(34)])
y = ionosphere[, c(34)]
y = as.numeric(y)
train.idx = sample(1:length(y), round(length(y) * 0.75))
test.idx = setdiff(1:length(y), train.idx)
train = X[train.idx, ]
test = X[test.idx, ]
train.labels = y[train.idx]
test.labels = y[test.idx]
accuracy = function (y_true, preds) {
  out = table(y_true,   
              max.col(preds, ties.method = "random")) 
  acc = sum(diag(out))/sum(out)
  acc
}
predictions = KernelKnn(train, test, train.labels, 
                        k = 5 ,             
                        method = 'euclidean',    
                        weights_function = NULL, 
                        regression = F,          
                        Levels = unique(y))
acc = accuracy(test.labels, predictions)
paste('Accuracy is ', acc)
predictions = KernelKnn(train, test, train.labels, 
                        k = 10,             
                        method = 'canberra',    
                        weights_function = 'epanechnikov',
                        regression = F,         
                        Levels = unique(y))
acc = accuracy(test.labels, predictions)
knn = KernelKnnCV(X, y, 
                  k = 9 ,                            
                  folds = 5,                         
                  method = 'canberra',               
                  weights_function = 'epanechnikov', 
                  regression = F,                    
                  Levels = unique(y),                
                  threads = 5)            
acc_cv = unlist(lapply(1:length(knn$preds), 
                       function(x) accuracy(y[knn$folds[[x]]],
                                            knn$preds[[x]])))
paste('Accuracy is ', mean(acc_cv))
paste('Accuracy is ', acc)
