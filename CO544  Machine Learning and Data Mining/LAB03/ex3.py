# CO544 - Machine Learning and Data Mining
# Lab 04 - Exercise 03
# E/15/366

#Importing numpy module
import numpy as np
#Importing pandas module
import pandas as pd

from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.datasets import load_iris
#Importing matplotlib module
import matplotlib.pyplot as plt

# Read Training dataset
df = pd.read_csv("Boston_Housing.csv")

#split test and train data into 20 and 80
train,test=train_test_split(df,test_size=0.2)

#testing data
y_test=test.MEDV
x_test=test.drop(['MEDV'],axis='columns')

#create a array for beta value
beta_arraynew = []

#create array for prediction
y_predictions=[]
for i in range(50):
    sample = train.sample( 100, replace=True )    # create 100 sample
    x_train=sample.drop('MEDV',axis=1)
    y_train=sample.MEDV
    
    x=np.array(x_train.values)
    y=np.array(y_train.values)
    rows = len(x)
    xx=np.ones((rows,1))
    xxx =np.append(xx,x, axis=1)
    x_inverse=np.linalg.inv(xxx.transpose().dot(xxx))
    x_new=x_inverse.dot(xxx.transpose())
    beta=x_new.dot(y)
    beta_arraynew.append(beta)
   
    
beta_array=np.array(beta_arraynew)

for i in range(50):
	y_predictions.append(x_test.dot(beta_array[i]))
	
#y_test_predictions_mean=np.array(y_predictions).mean(axis=0)

#plt.scatter(y_test_predictions_mean, Y_test.values,color = "r", marker = ".", s = 60)
#plt.xlim([0,1000000])
#plt.show()



