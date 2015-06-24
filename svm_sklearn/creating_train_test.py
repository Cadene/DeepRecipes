# -*- coding: utf-8 -*-

import pandas as pd
import numpy as np
from sklearn.cross_validation import train_test_split
from sklearn.cross_validation import StratifiedShuffleSplit
from sklearn.metrics import accuracy_score
from sklearn.svm import LinearSVC

df_all = pd.read_csv('../data/features/features.csv')

frames_train = []
frames_test = []

for uclass in df_all['class'].unique():
	df_uclass = df_all[df_all['class'] == uclass]
	df_train_uclass, df_test_uclass = train_test_split(df_uclass, test_size = 0.2)
	frames_train.append(df_train_uclass)
	frames_test.append(df_test_uclass)

df_train = pd.concat(frames_train)
df_test = pd.concat(frames_test)

def df2Xy(df):
	df.drop('id', axis=1, inplace=True)
	df.drop('image', axis=1, inplace=True)
	y = df['class'].values
	df.drop('class', axis=1, inplace=True)
	X = df.values
	return X, y 

X, y = df2Xy(df_train)
X_test, y_test = df2Xy(df_test)

clf = LinearSVC(penalty='l2', loss='squared_hinge',
	dual=True, tol=0.0001, C=0.5, multi_class='ovr',
	fit_intercept=True, intercept_scaling=1, class_weight=None,
	verbose=0, random_state=None, max_iter=1000)

def cross_val(X, y, clf):
	scores = []
	sss = StratifiedShuffleSplit(y, 5, test_size=0.2, random_state=0)
	for train_idx, test_idx in sss:
		X_train, X_test = X[train_idx], X[test_idx]
		y_train, y_test = y[train_idx], y[test_idx]
		clf.fit(X_train, y_train)
		score = accuracy_score(clf.predict(X_test), y_test)
		scores.append(score)
	print("SVM: acc: %0.4f, std: %0.4f" %(np.mean(scores), np.std(scores)))

cross_val(X, y, clf)


