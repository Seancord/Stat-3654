
# coding: utf-8

# In[1]:

#Sean Cordrey
#In Class 7 

#Part 1


# In[1]:

import pandas as pd
import numpy as np
import matplotlib as plt


# In[25]:

#2
carData = pd.read_table('vehicles.csv', header=False, sep=',')


# In[26]:

carData


# In[60]:

#3
    #1
carData['barrels08'].hist(bins=15)
title('barrels08')
savefig('histogram.png', dpi=400, bbox_inches='tight')


                
                
# In[66]:

#2 
carData['barrels08'].plot(kind='kde')
title('Barrel Consumption Frequency')
savefig('density.png', dpi=400, bbox_inches='tight')


# In[65]:

#3
city08 = carData['city08']
mpg = [0, 8, 16, 24, 32, 40]
categoricalMPG = pd.cut(city08, mpg)
carData['categoricalMPG']=categoricalMPG
categoricalFreq=pd.value_counts(categoricalMPG)
pd.value_counts(categoricalMPG)
pd.value_counts(categoricalMPG).plot(kind='bar')
title('MPG by Efficiency')
savefig('bar.png', dpi=400, bbox_inches='tight')


# In[67]:

#4
categoricalFreq_rel=categoricalFreq.div(categoricalFreq.sum(1).astype(float))
categoricalFreq_rel
categoricalFreq_rel.plot(kind='barh', stacked=True)
title('MPG by Efficiency(stacked)')
savefig('stacked', dpi=400, bbox_inches='tight')


# In[64]:

#5
plt.scatter(carData['barrels08'], carData['highway08'])
plt.title('Barrel Consumption vs Highway MPG')


# In[2]:

#Part 2
import scipy as sp
import sklearn as sk


# In[3]:

#2
medicalData=pd.read_table('Medical.csv', header=False, sep=',')
medicalData


# In[11]:

#4
X=array(medicalData[['Age', 'HgA1C']])
X


# In[10]:

#4
y=array(medicalData['A Literacy Category'])
y


# In[15]:

#5
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test= train_test_split(X, y, test_size=0.25, random_state=33)


# In[17]:

#6
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler().fit(X_train)
X_train = scaler.transform(X_train)
X_test = scaler.transform(X_test)


# In[18]:

#7
from sklearn.linear_model import SGDClassifier
clf = SGDClassifier()
clf.fit(X_train,y_train)


# In[19]:

clf.coef_


# In[20]:

clf.intercept_


# In[21]:

#equation
#  -27.6459 + 5.0897 * x1 + -16.8182 * x2 = 0


# In[22]:

#8
from sklearn import metrics
y_train_pred = clf.predict(X_train)
metrics.accuracy_score(y_train, y_train_pred)


# In[23]:

#9
y_pred = clf.predict(X_test)
print metrics.accuracy_score(y_test, y_pred)


# In[25]:

#10
metrics.confusion_matrix(y_test, y_pred)


# In[26]:

# 2 individuals were correctly placed by our classifier and 11 were incorrectly placed
#Our classifier in this data set is very weak. It did well in the train set because that it where it was derived from
#When used on our train set it did very poorly, so this specific classifier would be a good one to use.


# In[ ]:



