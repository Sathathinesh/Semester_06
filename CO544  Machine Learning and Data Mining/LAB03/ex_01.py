# CO544 - Machine Learning and Data Mining
# Lab 04 - Exercise 01
# Hisni Mohammed M.H (E/15/131)

import numpy as np              #Importing numpy module
import pandas as pd             #Importing pandas module
import matplotlib.pyplot as plt #importing matplotlib modules to plot

# Read Training dataset
data = pd.read_csv('Boston_Housing.csv', delimiter=',')

# Splitting dataset into a train and test set with 80% and 20%
train = data.sample(frac=0.8,random_state=200)
test = data.drop(train.index)
# print(len(train))
# print(len(test))

# Reset the index in data frame
train.reset_index(inplace=True)
train.drop(['index'], axis=1, inplace=True)
test.reset_index(inplace=True)
test.drop(['index'], axis=1, inplace=True)

# print(data.columns)
# Index(['RM', 'LSTAT', 'PTRATIO', 'MEDV']

# Divide the train & test dataset into feature matrix (x) and response vector (y).
y_train = train['MEDV'].tolist()
x_train = train.drop(['MEDV'],axis=1)
y_test = test['MEDV'].tolist()
x_test = test.drop(['MEDV'],axis=1)

# Generating X matrix for training set
X = np.ones( (x_train.shape[0],1), dtype=float )
X = np.concatenate( (X,x_train), axis=1 )
# print(X)

# Estimating the parameter values
b = np.linalg.inv( X.T @ X ) @ X.T @ y_train

# Prediction for training set
train_pred = X @ b

# Generating X matrix for test set
X_te = np.ones( (x_test.shape[0],1), dtype=float )
X_te = np.concatenate( (X_te,x_test), axis=1 )

# Prediction for test set
test_pred = X_te @ b

# Calculating residual errors for train and test sets
res_train = y_train - train_pred
res_test = y_test - test_pred

plt.scatter(train_pred, res_train, color = "r", marker = "*", s = 60, label='Train')    # Plotting a scatter plot
plt.scatter(test_pred, res_test, color = "b", marker = "*", s = 60, label='Test')       # Plotting a scatter plot
plt.title('Simple Linear Regression')   # Adding a title to the graph
plt.xlabel('Predicted value')           # Adding axis labels
plt.ylabel('Residual Errors')           # Adding axis labels
plt.legend()    # Display Legend
plt.show()      # Dsiplay Plot


