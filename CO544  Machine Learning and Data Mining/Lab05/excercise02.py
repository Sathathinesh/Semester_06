# E/15/366 , Thinesh.S
# Lab 05 excercise-02

# Importing Required modules.
import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import apriori
from mlxtend.frequent_patterns import association_rules


# (a) Import the given dataset 'groceries.csv'
grocc = pd.read_csv("groceries.csv", header=None)
items = grocc.values.tolist()
dataset = []
for item in items:
    dataset.append([i for i in item if str(i) != 'nan'])

#print(dataset)

##################################################################################################

# (b) 
te = TransactionEncoder()
te_ary = te.fit(dataset).transform(dataset)
df = pd.DataFrame(te_ary, columns=te.columns_)
#print(df)

#################################################################################################
# (c)
sup = apriori(df, min_support=0.1, use_colnames=True) #itemsets which minimum support is greate
print("part (c) : \nItemsets where the support is greater than 10%:")
print(sup)

#################################################################################################

# (d) 
rules = association_rules(sup, metric="lift", min_threshold=1)   #Association rules using the metric 'lift'
print("\npart (d):\nAssociation rules using the metric 'lift':")
print(rules)

##################################################################################################

# (f)
print("\npart (f): \nRules when the 'lift' is greater than 4 and the 'confidence' is greater than 0.8:")
print(rules[(rules['lift'] > 4) & (rules['confidence'] > 0.8)])



