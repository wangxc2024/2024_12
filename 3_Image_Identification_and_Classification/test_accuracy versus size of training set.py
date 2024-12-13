import os,shutil
from random import shuffle

import numpy as np
import cv2
from scipy import stats
# from sklearn.cross_validation import train_test_split
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, classification_report
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC
from keras_preprocessing.image import load_img
import matplotlib.pyplot as plt
import math
import tensorflow as tf
from keras import backend as K

# cat 0 负 dog 1 正
def shuffle_work(array,index):
    s=[]
    for i in range(len(index)):
        s.append(array[index[i]])
    return s

def calc(px,Y_test):
    tp,fn,fp,tn=0,0,0,0
    for i in range(len(Y_test)):       
        if Y_test[i]==1:
            if Y_test[i]==px[i]: tp=tp+1
            if Y_test[i]!=px[i]: fn=fn+1
        if Y_test[i]==0:
            if Y_test[i]==px[i]: tn=tn+1
            if Y_test[i]!=px[i]: fp=fp+1
    return tp, fn, fp, tn

def work_SVM(X_train,Y_train,X_test,Y_test):  
    SVM=SVC(kernel='linear')  
    SVM.fit(X_train,Y_train)   
    px=SVM.predict(X_test)
    print(classification_report(Y_test,px))
    return calc(px,Y_test)

def work_Nbayes(X_train,Y_train,X_test,Y_test):  
    Nbayes= GaussianNB()   
    Nbayes.fit(X_train,Y_train)       
    px=Nbayes.predict(X_test)
    print(classification_report(Y_test,px))
    return calc(px,Y_test)

def work_KNN(X_train,Y_train,X_test,Y_test):  
    KNN=KNeighborsClassifier(n_neighbors=5)
    KNN.fit(X_train,Y_train)   
    px=KNN.predict(X_test)
    print(classification_report(Y_test,px))
    return calc(px,Y_test)

def get_Parm(tp,fn,fp,tn):
    sn,sp,Acc,Avc,Mcc=0,0,0,0,0
    if tp + fn > 0: sp=tp/(tp+fn)
    if tn + fp > 0: sn=tn/(fp+tn)
    if tp+fn+tn+fp>0: Acc=(tp+tn)/(tp+tn+fp+fn)
    if (tp + fp)*(tp + fn)*(tn + fp)*(tn + fn) > 0: 
        Mcc=(tp * tn - fp * fn) / math.sqrt((tp + fp)*(tp + fn)*(tn + fp)*(tn + fn))  
    Avc=(sn + sp)/2
    return sp,sn,Acc,Mcc,Avc    

def pre_work(train_path,test_path,datrain,datest):
    X_train=[]
    Y_train=[]
    X_test=[]
    Y_test=[]

    # X_train, X_test, y_train, y_test
    for f in os.listdir(train_path+'/cats'):
        X_train.append(train_path + '/cats/' + str(f))
        Y_train.append(0)
    for f in os.listdir(train_path+'/dogs'):
        X_train.append(train_path + '/dogs/' + str(f))
        Y_train.append(1)
    for f in os.listdir(test_path+'/cats'):
        X_test.append(test_path + '/cats/' + str(f))
        Y_test.append(0)
    for f in os.listdir(test_path+'/dogs'):
        X_test.append(test_path + '/dogs/' + str(f))
        Y_test.append(1)

    index_train=[i for i in list(range(len(Y_train)))]
    shuffle(index_train)
    X_train = shuffle_work(X_train,index_train)
    Y_train = shuffle_work(Y_train,index_train)
    index_test=[i for i in list(range(len(Y_test)))]
    shuffle(index_test)
    X_test = shuffle_work(X_test,index_test)
    Y_test = shuffle_work(Y_test,index_test)

    # num=1000
    per_train=len(Y_train)/100*datrain
    per_test=len(Y_test)/100*datest
    X_train_per=[pic_work2(np.array(X_train[int(i*per_train):int((i+1)*per_train)])) for i in range(10)]
    Y_train_per=[Y_train[int(i*per_train):int((i+1)*per_train)] for i in range(10)]
    X_test_per=[pic_work2(np.array(X_test[int(i*per_test):int((i+1)*per_test)])) for i in range(10)]
    Y_test_per=[Y_test[int(i*per_test):int((i+1)*per_test)] for i in range(10)]
    # X_train = np.array(X_train[:num])
    # Y_train = np.array(Y_train[:num])
    # X_test = np.array(X_test[:100])
    # Y_test = np.array(Y_test[:100])
    # pic_train=pic_work2(X_train)
    # pic_test=pic_work2(X_test)
    # return pic_train,Y_train,pic_test,Y_test
    return X_train_per,Y_train_per,X_test_per,Y_test_per

def pic_work1(src):
    #图像读取及转换为像素直方图
    dest = []
    for i in src:
        # 读取图像
        image = cv2.imdecode(np.fromfile(i, dtype=np.uint8), cv2.IMREAD_COLOR)

        # 图像像素大小一致
        img = cv2.resize(image, (256, 256),interpolation=cv2.INTER_CUBIC)

        # 计算图像直方图并存储至X数组
        hist = cv2.calcHist([img], [0, 1], None,[256, 256], [0.0, 255.0, 0.0, 255.0])

        dest.append(((hist / 255).flatten()))

    return np.array(dest)

def pic_work2(src):
    print(src[1])
    images = [cv2.resize(cv2.imread(i),(224,224)) for i in src]
    images = np.array(images)
    images = np.array(np.float32(images).reshape(len(images), -1) / 255)
    # 加载预先训练的模型MobileNetV2来实现图像分类
    model = tf.keras.applications.MobileNetV2(include_top=False,weights="imagenet", input_shape=(224, 224, 3))
    predictions = model.predict(images.reshape(-1, 224, 224, 3))
    pred_images = predictions.reshape(images.shape[0], -1)
    K.clear_session() 
    return pred_images

def featureRank(X_train,Y_train):
    POS,NEG=[],[]
    for i in range(len(X_train)):
        if Y_train[i] == 1: POS.append(X_train[i,:])
        elif Y_train[i] == 0: NEG.append(X_train[i,:])
    POS=np.array(POS)
    NEG=np.array(NEG)
    tvalue=list(range(len(X_train[0,:])))
    pvalue=list(range(len(X_train[0,:])))
    dataDict={}
    for i in range(len(X_train[0,:])):
        (tvalue[i],pvalue[i])=stats.ttest_ind(POS[:,i],NEG[:,i])
        dataDict[i]=pvalue[i]
    tempRank=[i for i in dataDict.items()]
    rank=np.asarray(sorted(tempRank,key=lambda x:x[1]))
    return rank

    

def work(X_train_all,Y_train,X_test_all,Y_test,rank,num):
    Acc_svm=[0.0,1.0,-1.0]
    Acc_bys=[0.0,1.0,-1.0]
    Acc_knn=[0.0,1.0,-1.0]
    #Acc参数内存相关分类器的Acc的ave_of_sum、min和max
    for i in range(10):
        X_train=X_train_all[i][:,rank[:num,0].astype(int)]
        X_test=X_test_all[i][:,rank[:num,0].astype(int)] 
        S=work_SVM(X_train,Y_train[i],X_test,Y_test[i])
        N=work_Nbayes(X_train,Y_train[i],X_test,Y_test[i])
        K=work_KNN(X_train,Y_train[i],X_test,Y_test[i])
        # getParm(K[0],K[1],K[2],K[3])
        Acc_S=(S[0]+S[3])/(S[0]+S[1]+S[2]+S[3])
        Acc_N=(N[0]+N[3])/(N[0]+N[1]+N[2]+N[3])
        Acc_K=(K[0]+K[3])/(K[0]+K[1]+K[2]+K[3])
        Acc_svm[0]+=float(Acc_S)
        Acc_svm[1]=min(Acc_svm[1],float(Acc_S))
        Acc_svm[2]=max(Acc_svm[2],float(Acc_S))

        Acc_bys[0]+=float(Acc_N)
        Acc_bys[1]=min(Acc_bys[1],float(Acc_N))
        Acc_bys[2]=max(Acc_bys[2],float(Acc_N))
   
        Acc_knn[0]+=float(Acc_K)
        Acc_knn[1]=min(Acc_knn[1],float(Acc_K))
        Acc_knn[2]=max(Acc_knn[2],float(Acc_K))
    Acc_svm[0]/=10.0
    Acc_bys[0]/=10.0
    Acc_knn[0]/=10.0
    return Acc_svm,Acc_bys,Acc_knn

def draw(x,y):
    z1=np.array(y[:,0,0]) - np.array(y[:,0,2])
    z2=np.array(y[:,0,1]) - np.array(y[:,0,0])

    z3=np.array(y[:,1,0]) - np.array(y[:,1,2])
    z4=np.array(y[:,1,1]) - np.array(y[:,1,0])

    z5=np.array(y[:,2,0]) - np.array(y[:,2,2])
    z6=np.array(y[:,2,1]) - np.array(y[:,2,0])

    yerr1=[z1, z2]
    yerr2=[z3, z4]
    yerr3=[z5, z6]

    plt.plot(x, y[:,0,0], linewidth=1, color='red', label='SVM')
    plt.plot(x, y[:,1,0], linewidth=1, color='green', label='Nbayes')
    plt.plot(x, y[:,2,0], linewidth=1, color='blue', label='KNN')

    plt.errorbar(x,y[:,0,0],yerr=yerr1,color='red')
    plt.errorbar(x,y[:,1,0],yerr=yerr2,color='green')
    plt.errorbar(x,y[:,2,0],yerr=yerr3,color='blue')

    plt.xlabel("Number of features", fontsize=12)
    plt.ylabel("Accuracy", fontsize=12)

    plt.legend()
    plt.savefig('result.jpg') 
    plt.show()


def tradition(q):
    train_path = './dataset/training_set'
    test_path = './dataset/test_set'

    # img=load_img(train_path + "/cats/cat.1001.jpg")

    X = []  # 定义图像路径
    Y = []  # 定义图像分类类标
    Z = []  # 定义图像像素

    X_train_all,Y_train,X_test_all,Y_test = pre_work(train_path,test_path,q,10)
    rank = featureRank(X_train_all[0],Y_train[0])
    x,y=[],[]#y[数量,AccSNK]
    for i in range(20):
        x_tmp=10*i+1
        y_tmp=work(X_train_all,Y_train,X_test_all,Y_test,rank,x_tmp)
        x.append(x_tmp)
        y.append(y_tmp)
    y=np.array(y)
    x=np.array(x)
    actmp=save(x,y,q)
    Ac.append(actmp)
    
    #draw(x,y)

def MN():
    train_path = './dataset/training_set'
    test_path = './dataset/test_set'
    X_train_all,Y_train,X_test_all,Y_test = pre_work(train_path,test_path)

def save(x,y,q):
    z1=np.array(y[:,0,0]) - np.array(y[:,0,2])
    z2=np.array(y[:,0,1]) - np.array(y[:,0,0])

    z3=np.array(y[:,1,0]) - np.array(y[:,1,2])
    z4=np.array(y[:,1,1]) - np.array(y[:,1,0])

    z5=np.array(y[:,2,0]) - np.array(y[:,2,2])
    z6=np.array(y[:,2,1]) - np.array(y[:,2,0])

    yerr1=[z1, z2]
    yerr2=[z3, z4]
    yerr3=[z5, z6]
    np.savetxt('macc%d.csv'%q, y[:,:,0], delimiter=',')
    np.savetxt('macc1%d.csv'%q, y[:,:,1], delimiter=',')
    np.savetxt('macc2%d.csv'%q, y[:,:,2], delimiter=',')
    np.savetxt('err1%d.csv'%q, yerr1, delimiter=',')
    np.savetxt('err2%d.csv'%q, yerr2, delimiter=',')
    np.savetxt('err3%d.csv'%q, yerr3, delimiter=',')
    maccsvm=np.mean(y[5:,0,0])
    maccbys=np.mean(y[5:,1,0])
    maccknn=np.mean(y[5:,2,0])
    supaccsvm=np.mean(y[5:,0,1])
    supaccbys=np.mean(y[5:,1,1])
    supaccknn=np.mean(y[5:,2,1])
    infaccsvm=np.mean(y[5:,0,2])
    infaccbys=np.mean(y[5:,1,2])
    infaccknn=np.mean(y[5:,2,2])
    return maccsvm,maccbys,maccknn,supaccsvm,supaccbys,supaccknn,infaccsvm,infaccbys,infaccknn
        
Q=range(1,11)
Q8=range(1*800,11*800,800)
Ac=[]
for q in Q:
    
    tradition(q)
Ac=np.array(Ac)
np.savetxt('acc.csv', Ac, delimiter=',')
plt.plot(Q8, Ac[:,0], linewidth=1, color='red', label='SVM')
plt.plot(Q8, Ac[:,1], linewidth=1, color='green', label='Nbayes')
plt.plot(Q8, Ac[:,2], linewidth=1, color='blue', label='KNN')
plt.xlabel("Train", fontsize=12)
plt.ylabel("Accuracy", fontsize=12)

plt.legend()
plt.savefig('result.jpg') 
plt.show()


