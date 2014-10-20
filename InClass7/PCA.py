
# coding: utf-8

# In[1]:

get_ipython().magic(u'pylab inline')


# In[2]:

import sklearn as sk
import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt


## Principal Components Analysis

#### Dimensionality Reduction and Visualization

####### #Get the digits data

# In[3]:

from sklearn.datasets import load_digits
digits = load_digits()


####### #What does the digits dataset contain?

# In[4]:

print digits.keys()


####### #Each row of data in X_digits corresponds to one of the following digits:

# In[5]:

digits.target_names


# In[6]:

X_digits, y_digits = digits.data, digits.target


####### #What does the X matrix look like?

# In[7]:

X_digits.shape


####### #Get the first 10 principal components of the X_digits matrix

# In[8]:

from sklearn.decomposition import PCA

estimator = PCA(n_components=10)
X_pca = estimator.fit_transform(X_digits)


####### #What does the PCA matrix looks like

# In[9]:

X_pca.shape


# In[10]:

X_pca


####### #Visualize our data using the first two principal components in a scatterplot

# In[11]:

colors = ['black', 'blue', 'purple', 'yellow', 'white', 'red', 'lime', 'cyan', 'orange', 'gray']
for i in xrange(len(colors)):
    px = X_pca[:, 0][y_digits == i]
    py = X_pca[:, 1][y_digits == i]
    plt.scatter(px, py, c=colors[i])
plt.legend(digits.target_names)
plt.xlabel('First Principal Component')
plt.ylabel('Second Principal Component')


# In[12]:

#Digits like 0, 6, 1, 3, and 4 are fairly clear and distinct. Whereas 2, 8, 9, and 7 are all over the place not clustered well
#like the previous ones mentioned


# In[14]:

#3
colors = ['black', 'blue', 'purple', 'yellow', 'white', 'red', 'lime', 'cyan', 'orange', 'gray']
for i in xrange(len(colors)):
    px = X_pca[:, 7][y_digits == i]
    py = X_pca[:, 8][y_digits == i]
    plt.scatter(px, py, c=colors[i])
plt.legend(digits.target_names)
plt.xlabel('Eighth Principal Component')
plt.ylabel('Ninth Principal Component')


# In[ ]:

#Now using the eighth and ninth components, the clustering is pretty much non existant for any digit. They are all over the place
#spilling into each others group. These 2 components do not give us as much or any insight into information as do the first and second
#components. 

