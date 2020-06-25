#import standard data sets
from sklearn import datasets
#import the Logistic regression model
from sklearn.linear_model import LogisticRegression
import pandas as pd
#split data set into a train and test set
from sklearn.model_selection import train_test_split
#importing modules to measure classification performance
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix,accuracy_score
#import matpltolib #importing Matplotlib module
import matplotlib.pyplot as plt #pyplot is a collection of command style functions
from mpl_toolkits import mplot3d #importing modules for 3D plotting
import numpy as np
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from mpl_toolkits.mplot3d import Axes3D
#########################################################################

wine_dataset =datasets.load_wine() #load ’wine’ data set from standard data sets
x=wine_dataset["data"] #defining features values
scaler=StandardScaler()#instantiate
scaler.fit(x) # compute the mean and standard which will be used in the next command
x=scaler.transform(x)# fit and transform can be applied together and I leave that for simple exercise

df = pd.DataFrame(wine_dataset.data, columns=wine_dataset.feature_names)
df ['target'] = pd.Series(wine_dataset.target)
# we can check the minimum and maximum of the scaled features which we expect to be 0 and 1
#print ("after scaling minimum", X_scaled.min(axis=0) )
#x=wine_dataset["class_0"]
#print(list(df.target_names))

colors = ("red", "green", "blue")
X_reduced = PCA(n_components=3).fit_transform(x)
principalDf = pd.DataFrame(data = X_reduced , columns = ['principal component 1', 'principal component 2','principal component 3'])
finalDf = pd.concat([principalDf,df[['target']]],axis = 1)


# To getter a better understanding of interaction of the dimensions
# plot the first three PCA dimensions
fig = plt.figure(1, figsize=(8, 6))
ax = Axes3D(fig, elev=-150, azim=110)
targets = [0,1,2]
for target, color in zip(targets,colors):
    indices = finalDf['target'] == target
    ax.scatter(finalDf.loc[indices, 'principal component 1'], finalDf.loc[indices, 'principal component 2']
               ,finalDf.loc[indices, 'principal component 3'] , c = color
               , s=30)
ax.set_title("PCA directions")
ax.set_xlabel('Principal Component 1', fontsize = 10,labelpad =20)
ax.w_xaxis.set_ticklabels([])
ax.set_ylabel('Principal Component 2', fontsize = 10,labelpad =20)
ax.w_yaxis.set_ticklabels([])
ax.set_zlabel('Principal Component 3', fontsize = 10,labelpad =1)
ax.w_zaxis.set_ticklabels([])
ax.legend(['Class0','Class1','Class2'],loc='upper right')
plt.show()
