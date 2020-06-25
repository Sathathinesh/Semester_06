# E/15/366
# Lab 04


#import standard data sets
from sklearn import datasets
#import pandas
import pandas as pd
#import matpltolib #importing Matplotlib module
import matplotlib.pyplot as plt #pyplot is a collection of command style functions
from mpl_toolkits import mplot3d #importing modules for 3D plotting
import numpy as np
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from mpl_toolkits.mplot3d import Axes3D

#########################################################################


#Import the wine dataset from scikit learn standard datasets
wine_dataset =datasets.load_wine() #load ’wine’ data set from standard data sets
x=wine_dataset["data"] #defining features values
scaler=StandardScaler()#instantiate
scaler.fit(x) # compute the mean and standard which will be used in the next command
x=scaler.transform(x)# fit and transform can be applied together and I leave that for simple exercise

df = pd.DataFrame(wine_dataset.data, columns=wine_dataset.feature_names)
df ['target'] = pd.Series(wine_dataset.target)

#define colours
colors = ("red", "green", "blue")

##########################################################################

#Principal Component Ananlysis with 3 components
X_reduced = PCA(n_components=3).fit_transform(x)

principaldata = pd.DataFrame(data = X_reduced , columns = ['principal component 1', 'principal component 2','principal component 3'])
dfnew = pd.concat([principaldata,df[['target']]],axis = 1)


#creating a figure
fig = plt.figure(1, figsize=(10, 6))
ax = Axes3D(fig, elev=-150, azim=110)

targets = [0,1,2]    #define tha targets

for target, color in zip(targets,colors):
    indices = dfnew['target'] == target
    ax.scatter(dfnew.loc[indices, 'principal component 1'], dfnew.loc[indices, 'principal component 2']
               ,dfnew.loc[indices, 'principal component 3'] , c = color, s=60)
    
ax.set_title(" Visualize the Wine dataset PCA")
ax.set_xlabel('Principal_Component_1', fontsize = 10,labelpad =20)
#ax.w_xaxis.set_ticklabels([])
ax.set_ylabel('Principal_Component_2', fontsize = 10,labelpad =20)
#ax.w_yaxis.set_ticklabels([])
ax.set_zlabel('Principal_Component_3', fontsize = 10,labelpad =1)
#ax.w_zaxis.set_ticklabels([])
ax.legend(['Class_0','Class_1','Class_2'])
plt.show()
