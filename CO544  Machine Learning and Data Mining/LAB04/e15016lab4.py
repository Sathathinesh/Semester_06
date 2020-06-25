#CO544
#Lab4
#Lab Exercise

import matplotlib #importing Matplotlib module
import numpy as np #importing numpy module
import pandas as pd #importing pandas module 
import matplotlib.pyplot as plt #pyplot is a collection of command style functions 
from mpl_toolkits import mplot3d #importing modules for 3D plotting
from sklearn import datasets #import standard data sets
from sklearn.preprocessing import StandardScaler #import StandardScaler 
from sklearn.decomposition import PCA #import PCA

wine_dataset =datasets.load_wine() #load 'wine' data set from standard data sets

x=wine_dataset["data"] #defining features values

df = pd.DataFrame(wine_dataset.data, columns=wine_dataset.feature_names)

df ['target'] = pd.Series(wine_dataset.target)

#print(df['target'])

x = StandardScaler().fit_transform(x) # Standardizing the features

pca = PCA(n_components=3)

principalComponents = pca.fit_transform(x)

principalDf = pd.DataFrame(data = principalComponents , columns = ['principal component 1', 'principal component 2','principal component 3'])

#print(principalDf)

finalDf = pd.concat([principalDf,df[['target']]],axis = 1)

#print(finalDf)

fig = plt.figure(figsize = (10,20)) #creating a figure

ax = fig.add_subplot(311, projection='3d') #creating 3D subplot
 
fig.subplots_adjust(right=1.0)#Set the spacing between subplots

#Labeling the axes and giving a title to the plot
ax.set_xlabel('Principal Component 1', fontsize = 10,labelpad =20)
ax.set_ylabel('Principal Component 2', fontsize = 10,labelpad =20)
ax.set_zlabel('Principal Component 3', fontsize = 10,labelpad =1)
ax.set_title('3 component PCA on wine_dataset', fontsize = 14,fontweight = 'bold',pad = 20)

ax.view_init(60,35) #Visualizing in a diffrent angle

targets = [0,1,2]

colors = ['b', 'y', 'g']

for target, color in zip(targets,colors):
    indices = finalDf['target'] == target
    ax.scatter(finalDf.loc[indices, 'principal component 1'], finalDf.loc[indices, 'principal component 2']
               ,finalDf.loc[indices, 'principal component 3'] , c = color
               , s=30,marker = '*' )

ax.legend(['Class0','Class1','Class2'],loc='upper right')#Class0 for 0, Class1 for 1,Class2 for 2 
plt.savefig('lab_exercise.png',dpi =400,bbox_inches ='tight') #Saving the 3D plot to a file 
plt.show() #Display the plot
