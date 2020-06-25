# E/15/366 , Thinesh.S
# Lab05 excercise-01

import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from sklearn import datasets
from sklearn.decomposition import PCA
from sklearn.cluster import KMeans

# (a)
iris = datasets.load_iris() # Import ’iris’ dataset from the standard Scikit-learn datasets.
x = iris.data 
y = iris.target

###########################################################################################################


# (b) 
wcss = []    # Within Cluster Sum of Squares

#Use Elbow method to identify the best k which minimizes the Within-Cluster-Sum-of-Squared(inertia).
for i in range(1, 11):
    kmeans = KMeans(n_clusters=i, init='k-means++', max_iter=300, n_init=10, random_state=0)
    kmeans.fit(x)
    wcss.append(kmeans.inertia_)

# Visualize the data wcss
#plt.plot(range(1, 11), wcss)
#plt.title('Elbow Method ')
#plt.xlabel('Number of clusters')
#plt.ylabel('WCSS')
#plt.show()

##############################################################################################################

# (c) 
kmeans = KMeans(n_clusters=3, random_state=0)                   # from Elbow method we identified n_clusters=3
closest_cluster_index = kmeans.fit_predict(x)
cluster_centers = kmeans.cluster_centers_
#print(kmeans.cluster_centers_)

#############################################################################################################

# (d) 

    # When printing kmeans.cluster_centers : 
    # [[6.85       3.07368421 5.74210526 2.07105263]
    #  [5.006      3.428      1.462      0.246     ]
    #  [5.9016129  2.7483871  4.39354839 1.43387097]]

    
    # The 3 rows represents the 3 clusters and the 4 columns represents the 4 feature columns in the dataset.
    # This is used to find the center of the clusters.
    # The result gives the average of all values that belongs to a particular cluster in each column.


#############################################################################################################


# (e)  
fig = plt.figure('K-Means on Iris Dataset Cluster')             # creating a figure
ax = plt.axes(projection='3d')                                  # creating 3D subplot
ax.set_xlabel('sepal length x')
ax.set_ylabel('sepal width y')
ax.set_zlabel('petal length z')

ax.scatter(x[:, 0], x[:, 1], x[:, 2], c=y, cmap='Dark2', s=50)  # first three variables of the dataset are the axes.

ax.scatter(cluster_centers[:, 0], cluster_centers[:, 1], cluster_centers[:, 2], s=150, c='b', label='cluster_centroid') #cluster centers in a 3D plot

ax.legend()
plt.show()

#############################################################################################################


