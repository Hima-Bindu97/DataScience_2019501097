# -*- coding: utf-8 -*-
"""codecamp-1

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1-MvJpRe56niuaYuMt8fK7uMk8vODdkmw
"""

import numpy as np
import pandas as pd
from sklearn import preprocessing
from sklearn.preprocessing import OneHotEncoder
from sklearn.impute import KNNImputer
# from sklearn.linear_model.import.Ridge
# from sklearn.linear_model.import.LinearRegression
# from sklearn.metrics.import.mean_squared_error as mean_squared_error
import io
from google.colab import files
uploaded=files.upload()

df2 = pd.read_csv(io.BytesIO(uploaded['train.csv']))
trainx_df=pd.read_csv("train.csv",index_col='Id')
print(trainx_df.shape)
trainy_df=trainx_df['SalePrice']
print(trainy_df.shape)
trainx_df.drop('SalePrice',axis=1,inplace=True)
testx_df=pd.read_csv("test.csv",index_col="Id")
print(trainx_df.shape)
print(trainx_df.isnull().sum())

sample_size=len(trainx_df)
columns_with_null_values = []
columns_with_null_values=[[col,float(trainx_df[col].isnull().sum())/float(sample_size)] for col in trainx_df.columns if trainx_df[col].isnull().sum()]
print(columns_with_null_values)

columns_to_drop=[x for (x,y) in columns_with_null_values if y>.3]
print(columns_to_drop)

trainx_df.drop(columns_to_drop,axis=1,inplace=True)
print(trainx_df.shape)
testx_df.drop(columns_to_drop,axis=1,inplace=True)
print(testx_df.shape)

print(trainx_df.dropna(axis=0,inplace=True))

categorical_columns=[col for col in trainx_df.columns if trainx_df[col].dtype==object]
print(categorical_columns,'\n',len(categorical_columns))
#categorical_columns.append('MSSubClass')
ordinal_columns=[col for col in trainx_df.columns if col not in categorical_columns]

dummy_row=list()
for col in trainx_df.columns:
  if col in categorical_columns:
    dummy_row.append("dummy")
  else:
    dummy_row.append("")
print(dummy_row)

import numpy as np
import pandas as pd
from sklearn import preprocessing
from sklearn.preprocessing import OneHotEncoder
from sklearn.impute import KNNImputer
# from sklearn.linear_model.import.Ridge
# from sklearn.linear_model.import.LinearRegression
# from sklearn.metrics.import.mean_squared_error as mean_squared_error
import io
from google.colab import files
uploaded=files.upload()

df2 = pd.read_csv(io.BytesIO(uploaded['train.csv']))
trainx_df=pd.read_csv("train.csv",index_col='Id')
print(trainx_df.shape)
trainy_df=trainx_df['SalePrice']
print(trainy_df.shape)
trainx_df.drop('SalePrice',axis=1,inplace=True)
testx_df=pd.read_csv("test.csv",index_col="Id")
print(trainx_df.shape)
print(trainx_df.isnull().sum())
sample_size=len(trainx_df)
print(sample_size)
columns_with_null_values=[]
for col in trainx_df.columns:
   if trainx_df[col].isnull().sum():
        columns_with_null_values.append([col,float(trainx_df[col].isnull().sum())/float(sample_size)])
print(columns_with_null_values)        
columns_to_drop=[x for (x,y) in columns_with_null_values if y >.3]
print(columns_to_drop)
trainx_df.drop(columns_to_drop,axis=1,inplace=True)
testx_df.drop(columns_to_drop,axis=1,inplace=True)
print(testx_df.shape)
print(trainx_df.shape)

categorical_columns=[col for col in trainx_df.columns if            trainx_df[col].dtype==object]
ordinal_columns=[col for col in trainx_df.columns if col not in categorical_columns]
dummy_row=list()
for col in trainx_df.columns:
    if col in categorical_columns:
        dummy_row.append("dummy")
    else:
        dummy_row.append("")
print(dummy_row)  

new_row=pd.DataFrame([dummy_row],columns=trainx_df.columns)
trainx_df=pd.concat([trainx_df,new_row],axis=0, ignore_index=True)
testx_df=pd.concat([testx_df],axis=0,ignore_index=True)
for col in categorical_columns:
    trainx_df[col].fillna(value="dummy",inplace=True)
    testx_df[col].fillna(value="dummy",inplace=True)
enc = OneHotEncoder(drop='first',sparse=False)
enc.fit(trainx_df[categorical_columns])
trainx_enc=pd.DataFrame(enc.transform(trainx_df[categorical_columns]))
testx_enc=pd.DataFrame(enc.transform(testx_df[categorical_columns]))
trainx_enc.columns=enc.get_feature_names(categorical_columns)
testx_enc.columns=enc.get_feature_names(categorical_columns)
trainx_df=pd.concat([trainx_df[ordinal_columns],trainx_enc],axis=1,ignore_index=True)
testx_df=pd.concat([testx_df[ordinal_columns],testx_enc],axis=1,ignore_index=True)
trainx_df.drop(trainx_df.tail(1).index,inplace=True)
imputer=KNNImputer(n_neighbors=2)
imputer.fit(trainx_df)
trainx_df_filled=imputer.transform(trainx_df)
trainx_df_filled=pd.DataFrame(trainx_df_filled,columns=trainx_df.columns)
testx_df_filled=imputer.transform(testx_df)
testx_df_filled=pd.DataFrame(testx_df_filled,columns=testx_df.columns)
testx_df_filled.reset_index(drop=True,inplace=True)
print(testx_df_filled.isnull().sum())
scale='Standard'
if scale == 'Standard':
    scaler = preprocessing.StandardScaler().fit(trainx_df)
    trainx_df=scaler.transform(trainx_df)
    testx_df=scaler.transform(testx_df)
elif scale == 'MinMax':
    scaler=preprocessing.MinMaxScaler().fit(trainx_df)
    trainx_df=scaler.transform(trainx_df)
    testx_df=scaler.transform(testx_df)
print(trainx_df,testx_df)

