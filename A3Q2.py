#!/usr/bin/python

import numpy as np 
import os
import matplotlib.pyplot as plt
import math

#step1

X_train = np.zeros((10000,1))
Y_train = np.zeros((10000,1))
file_content = ''
mode = 'r'
filename = 'train.csv'
fo = open(filename, mode)

file_content=fo.readline()
line=fo.readline() 
i=0
while line:
	X_train[i],Y_train[i] = line.split(",")
        line = fo.readline()
        i=i+1

new_X_train=np.insert(X_train, 0, 1, axis=1)

#step2

w= np.random.rand(2,1)

#step3

plt.plot(Y_train,X_train,  'b.')
X_1 = new_X_train.transpose()
W_1 = w.transpose()
D = np.dot(W_1,X_1)
plt.plot(D.transpose(),X_train,  'r')
plt.xlabel('x - AXIS')
plt.ylabel('y - AXIS')
plt.show()

#step4
w_direct = np.dot(new_X_train.transpose(),new_X_train)
w_direct = np.linalg.inv(w_direct)
w_direct = np.dot(w_direct,new_X_train.transpose())
w_direct = np.dot(w_direct,Y_train)
w_1 = np.dot(w_direct.transpose(),X_1)
plt.plot(Y_train, X_train, 'b.')
plt.plot(w_1.transpose(),X_train,  'r')
plt.xlabel('x - AXIS')
plt.ylabel('y - AXIS')
plt.show()

#step5

for epoch in range(1,5):
   for j in range(1,10000):
        X_a = new_X_train[j].reshape(2,1)
        D_a = np.dot(w.reshape(1,2),X_a)
        D_b = D_a - Y_train[j]
        w = w - (.00000001)*D_b*X_a
        W_1 = w.reshape(1,2)
        D = np.dot(W_1,X_a)

        if j%100 == 0:
            plt.plot(Y_train[j], X_train[j], 'b.')
	    plt.plot(D[0], X_train[j], 'r.')
            plt.xlabel('x - AXIS')
            plt.ylabel('y - AXIS')
            plt.show()         
       
#step6
w_3 = np.dot(w.transpose(),X_1)
plt.plot(Y_train, X_train, 'b.')
plt.plot(w_3.transpose(), X_train, 'r')
plt.show()

#step7
mode = 'r'
filename = 'test.csv'
fo = open(filename, mode)
X_test = np.zeros((10500,1))

Y_test = np.zeros((10500,1))
new_file_content=''
new_file_content=fo.readline()
line1=fo.readline() 

i=0

while line1:
	X_test[i],Y_test[i] = line1.split(",")
        line1 = fo.readline()
        i=i+1

new_X_test=np.insert(X_test, 0, 1, axis=1)
y_pred1 = np.dot(new_X_test, w)
error=0
for n in range(0,10500):
    erro = y_pred1[n] - Y_test[n]
    error = error + erro*erro

error1 = error/10500
rms_error = math.sqrt(error1)
     
w_direct = np.dot(new_X_train.transpose(),new_X_train)
w_direct = np.linalg.inv(w_direct)
w_direct = np.dot(w_direct,new_X_train.transpose())
w_direct = np.dot(w_direct,Y_train)

y_pred2 = np.dot(new_X_test,w_direct)

err=0
for n in range(0,10500):
    erro = y_pred2[n] - Y_test[n]
    err = err + erro*erro

error2 = err/10500
rms_error2 = math.sqrt(error2)


















 


fo.close()
