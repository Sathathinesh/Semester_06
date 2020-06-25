from sklearn.datasets import make_classification
from matplotlib import pyplot as plt
from sklearn import tree
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import LabelEncoder
import pandas as pd
import numpy
from numpy import asarray
# Generate and dataset for Logistic Regression

inputs = pd.read_csv("data.csv")	


Label_A1=LabelEncoder()
Label_A2=LabelEncoder()
Label_A3=LabelEncoder()
Label_A4=LabelEncoder()
Label_A6=LabelEncoder()
Label_A8=LabelEncoder()
Label_A9=LabelEncoder()
Label_A11=LabelEncoder()
Label_A13=LabelEncoder()
Label_A14=LabelEncoder()
Label_A15=LabelEncoder()
Label_A16=LabelEncoder()


inputs['A1_new']=Label_A1.fit_transform(inputs['A1'])
inputs['A2_new']=Label_A2.fit_transform(inputs['A2'])
inputs['A3_new']=Label_A3.fit_transform(inputs['A3'])
inputs['A4_new']=Label_A4.fit_transform(inputs['A4'])
inputs['A6_new']=Label_A6.fit_transform(inputs['A6'])
inputs['A8_new']=Label_A8.fit_transform(inputs['A8'])
inputs['A9_new']=Label_A9.fit_transform(inputs['A9'])
inputs['A11_new']=Label_A11.fit_transform(inputs['A11'])
inputs['A13_new']=Label_A13.fit_transform(inputs['A13'])
inputs['A14_new']=Label_A14.fit_transform(inputs['A14'])
inputs['A15_new']=Label_A15.fit_transform(inputs['A15'])
inputs['A16_new']=Label_A16.fit_transform(inputs['A16'])

target=inputs['A16_new']


inputs_n=inputs.drop(['A1','A2','A3','A4','A6','A8','A9','A11','A13','A14','A15','A16','A16_new'],axis='columns')

inputs_n=inputs_n[['A1_new','A2_new','A3_new','A4_new','A5','A6_new','A7','A8_new','A9_new','A10','A11_new','A12','A13_new','A14_new','A15_new',]]

model=RandomForestRegressor(n_estimators = 1000,oob_score=True, random_state = 42)

print("Random Forrest classification :",model.fit(inputs_n,target),"\n")
print("Training set Accuracy:",model.score(inputs_n,target),"\n")

train = pd.read_csv("train.csv")
train['A1_new']=Label_A1.fit_transform(train['A1'])
train['A2_new']=Label_A2.fit_transform(train['A2'])
train['A3_new']=Label_A3.fit_transform(train['A3'])
train['A4_new']=Label_A4.fit_transform(train['A4'])
train['A6_new']=Label_A6.fit_transform(train['A6'])
train['A8_new']=Label_A8.fit_transform(train['A8'])
train['A9_new']=Label_A9.fit_transform(train['A9'])
train['A11_new']=Label_A11.fit_transform(train['A11'])
train['A13_new']=Label_A13.fit_transform(train['A13'])
train['A14_new']=Label_A14.fit_transform(train['A14'])
train['A15_new']=Label_A15.fit_transform(train['A15'])

train_n=train.drop(['A1','A2','A3','A4','A6','A8','A9','A11','A13','A14','A15'],axis='columns')
train_n=train_n[['A1_new','A2_new','A3_new','A4_new','A5','A6_new','A7','A8_new','A9_new','A10','A11_new','A12','A13_new','A14_new','A15_new',]]

print("Prediction margin: ",model.predict(train_n),"\n")
result=numpy.round_(model.predict(train_n))
result = result.astype('int64') 

print("Rounded result: ",result,"\n")

out=asarray(Label_A16.inverse_transform(result))
numpy.savetxt("out.csv",out,fmt='%s', delimiter=",")

print("Predicted A16: ",Label_A16.inverse_transform(result))