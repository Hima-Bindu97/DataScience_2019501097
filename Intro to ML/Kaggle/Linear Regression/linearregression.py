import numpy as np
import pandas as pd
import seaborn as sns
from sklearn import preprocessing
from sklearn.preprocessing import StandardScaler
from sklearn import metrics
from matplotlib import pyplot as plt
from sklearn.linear_model import Ridge
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import io
from google.colab import files
uploaded=files.upload()

df=pd.read_csv(io.BytesIO(uploaded['Advertising.csv']))
td=pd.read_csv("Advertising.csv")

td.head()

td.tail()

td.describe()

sns.regplot(x="TV" , y="Sales" , data=td)

sns.regplot(x="Radio" , y="Sales" , data=td)

sns.regplot(x="Newspaper" , y="Sales" , data=td)

td.head(10)

td.drop('Unnamed: 0',inplace=True,axis=1)

td.head(10)

td.isnull().sum()

td.dropna(inplace=True)

X = td.iloc[:, [0 , 1, 2]]
y = td.iloc[:, [3]]

X_train, X_test, y_train, y_test = train_test_split( X, y, test_size = 0.2, random_state = 0)

sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

model=LinearRegression()
model.fit(X_train,y_train)

print("The linear model is: Y = {:.5} + {:.5}*TV + {:.5}*radio + {:.5}*newspaper".format(model.intercept_[0], model.coef_[0][0], model.coef_[0][1], model.coef_[0][2]))

y_pred = model.predict(X_test)

print('Mean Absolute Error:', metrics.mean_absolute_error(y_test, y_pred))  
print('Mean Squared Error:', metrics.mean_squared_error(y_test, y_pred))  
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

model.score(X_test, y_test)

import statsmodels.api as sm
X = np.column_stack((td['TV'], td['Radio'], td['Newspaper']))
y = td['Sales']

X2 = sm.add_constant(X)
est = sm.OLS(y, X2)
est2 = est.fit()
print(est2.summary())

ax1 = sns.distplot(y_test, hist=False, color="r", label="Actual Value")
sns.distplot(y_pred, hist=False, color="b", label="Predicted Values" , ax=ax1)