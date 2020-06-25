# CO544 - Machine Learning and Data Mining
# Lab 04 - Exercise 03
# Hisni Mohammed M.H (E/15/131)

import numpy as np              #Importing numpy module
import pandas as pd             #Importing pandas module
import matplotlib.pyplot as plt #importing matplotlib modules to plot

# Read Training dataset
data = pd.read_csv('Boston_Housing.csv', delimiter=',')

# Splitting dataset into a train and test set with 80% and 20%
train = data.sample(frac=0.8,random_state=200)
test = data.drop(train.index)
# Reset the index in data frame
train.reset_index(inplace=True)
train.drop(['index'], axis=1, inplace=True)
test.reset_index(inplace=True)
test.drop(['index'], axis=1, inplace=True)

# Divide the test dataset into feature matrix (x) and response vector (y).
y_test = test['MEDV'].tolist()
x_test = test.drop(['MEDV'],axis=1)

# Generating X matrix for test set
X_te = np.ones( (x_test.shape[0],1), dtype=float )
X_te = np.concatenate( (X_te,x_test), axis=1 )

# To store response values from each models
test_pred = np.empty( [x_test.shape[0],50] )

for i in range(50):
    #Create random samples by sampling with replacement
    sample = train.sample( 100, replace=True )

    # Divide the sample training dataset into feature matrix (x) and response vector (y)
    y_train = sample['MEDV'].tolist()
    x_train = sample.drop(['MEDV'],axis=1)
    
    # Generating X matrix for sample training set
    X = np.ones( (x_train.shape[0],1), dtype=float )
    X = np.concatenate( (X,x_train), axis=1 )

    # Estimating the parameter values
    b = np.linalg.inv( X.T @ X ) @ X.T @ y_train

    # Predictions for test set
    test_pred[:,i] = X_te @ b

# Make the predictions for test data, by taking the average
test_pred_avg = np.average( test_pred, axis=1 )

# Calculating residual errors for test set
res_test = y_test - test_pred_avg

plt.scatter( test_pred_avg, res_test, color = "b", marker = "*", s = 60 )   # Plotting a scatter plot
plt.title('Ensemble Learning')  # Adding a title to the graph
plt.xlabel('Predicted value')   # Adding axis labels
plt.ylabel('Residual Errors')   # Adding axis labels
plt.show()  # Dsiplay Plot
