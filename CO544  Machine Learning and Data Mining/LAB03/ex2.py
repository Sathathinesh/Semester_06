#import standard data sets
from sklearn import datasets
#import the Logistic regression model
from sklearn.linear_model import LogisticRegression
#split data set into a train and test set
from sklearn.model_selection import train_test_split
#importing modules to measure classification performance
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix,accuracy_score

dataset =datasets.load_digits() #load ’wine’ data set from standard data sets
x=dataset["data"] #defining features values
y =dataset["target"] #defining target variable values
#splitting data set into a train and test set with 80% and 20%
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=1)

log_reg = LogisticRegression() #creating an instance of the model

log_reg.fit(x_train,y_train) #fitting the relationship between data
predictions = log_reg.predict(x_test) #predict labels for test data

print(classification_report(y_test, predictions))
print(confusion_matrix(y_test, predictions))
print(accuracy_score(y_test, predictions))
