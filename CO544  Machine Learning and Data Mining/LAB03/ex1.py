# CO544 - Machine Learning and Data Mining
# Lab 04 - Exercise 01
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

#y_train = MEDV data
y_train=train.MEDV
#others are x train 
x_train=train.drop('MEDV',axis=1)

#save train x,y into array
x=np.array(x_train.values)
y=np.array(y_train.values)

rows = len(x)    #find the length of x
xx=np.ones((rows,1))
xxx =np.append(xx,x, axis=1) #add ones in first colum

x_inverse=np.linalg.inv(xxx.transpose().dot(xxx))   #find the inverse of xxx
x_new=x_inverse.dot(xxx.transpose())                

beta=x_new.dot(y)              #find the beta value
y_new = xxx.dot(beta)          # find  Predict the response values for
                               #the training and test sets using the derived regression model.
#print(y_new)

error = y-y_new                #clculate the error
#print(error)

np.savetxt("y_new.csv",y_new,fmt='%s',delimiter=",")   #save the predict values in y_new.csv file
np.savetxt("y.csv",y,fmt='%s',delimiter=",")           

plt.scatter(y_new,y,color="r",marker=".",s=60)         #Visualize the residual errors for both train and test sets in one graph
plt.show()
