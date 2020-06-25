# CO544 - Machine Learning and Data Mining
# Lab 04 - Exercise 02
# Hisni Mohammed M.H (E/15/131)

# Import standard data sets
from sklearn import datasets
# Import the Logistic regression model
from sklearn.linear_model import LogisticRegression
# Split data set into a train and test set
from sklearn.model_selection import train_test_split
# Importing modules to measure classification performance
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix,accuracy_score

#Loading 'digits' data set from standard data sets
digits_dataset = datasets.load_digits()    
x = digits_dataset["data"]     # Defining features values
y = digits_dataset["target"]   # Defining target variable values

# Splitting data set into a train and test set with 80% and 20%
x_train, x_test, y_train, y_test = train_test_split( x, y, test_size=0.2, random_state=1 )

# Creating an instance of the Logistic Regression model
# log_reg = LogisticRegression()
log_reg = LogisticRegression(solver='liblinear',multi_class='ovr') # Dealing with FutureWarnings
# Fitting the relationship between data 
log_reg.fit(x_train,y_train)
# Predict labels for test data
predictions = log_reg.predict(x_test)

# Classification Report, Confusion Matrix and Accuracy
print( classification_report( y_test, predictions ) )
print( confusion_matrix( y_test, predictions ) )
print( accuracy_score( y_test, predictions ) )