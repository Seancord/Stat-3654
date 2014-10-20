
# coding: utf-8

# In[16]:

#Sean Cordrey
#October 20, 2014
#HW4

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# In[5]:

vehiclesData=pd.read_csv('vehicles.csv')


# In[7]:

vehiclesData


# In[8]:

#4
vehiclesData['highway08'].describe()
vehiclesData['highway08U'].describe()
vehiclesData['highwayA08'].describe()
vehiclesData['highwayA08U'].describe()
vehiclesData['highwayCD'].describe()
vehiclesData['highwayE'].describe()
vehiclesData['highwayUF'].describe()
vehiclesData['hlv'].describe()
vehiclesData['id'].describe()
vehiclesData['lv2'].describe()
vehiclesData['lv4'].describe()
vehiclesData['pv2'].describe()
vehiclesData['pv4'].describe()


# In[10]:

#5
vehiclesData['guzzler'].fillna('F')
vehiclesData['tCharger'].fillna('F')
vehiclesData['sCharger'].fillna('F')
vehiclesData['evMotor'].fillna('F')


# In[14]:

#7
vehiclesData['youSaveSpend'].hist(bins= 25)
title('youSaveSpend')


# In[22]:

plt.scatter(vehiclesData['highway08U'], vehiclesData['co2TailpipeGpm'])
title('Highway MPG vs CO2 Emmisions (GPM)')


# In[28]:


plt.scatter(vehiclesData['barrels08'], vehiclesData['highway08'])
title('Barrel Consumption vs Highway MPG')


# In[29]:

vehiclesData.to_pickle('vehiclesData_pickle.pkl')


# In[ ]:



