import os,shutil
from random import shuffle
import cv2
import numpy as np
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
import seaborn
os.environ["CUDA_DEVICE_ORDER"] = "PCI_BUS_ID"  
os.environ["CUDA_VISIBLE_DEVICES"] = "-1"



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
    # print(classification_report(Y_test,px))
    return calc(px,Y_test)

def work_Nbayes(X_train,Y_train,X_test,Y_test):  
    Nbayes= GaussianNB()   
    Nbayes.fit(X_train,Y_train)       
    px=Nbayes.predict(X_test)
    # print(classification_report(Y_test,px))
    return calc(px,Y_test)

def work_KNN(X_train,Y_train,X_test,Y_test):  
    KNN=KNeighborsClassifier(n_neighbors=5)
    KNN.fit(X_train,Y_train)   
    px=KNN.predict(X_test)
    # print(classification_report(Y_test,px))
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

def pre_work(train_path,test_path):
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
    per_train=len(Y_train)/10
    per_test=len(Y_test)/20
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
    # print(src[1])
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
    for i in range(10):
        for j in range(len(X_train)):
            if Y_train[i][j] == 1: POS.append(X_train[i][j,:])
            elif Y_train[i][j] == 0: NEG.append(X_train[i][j,:])
    POS=np.array(POS)
    NEG=np.array(NEG)
    tvalue=list(range(len(X_train[0][0,:])))
    pvalue=list(range(len(X_train[0][0,:])))
    dataDict={}
    for i in range(len(X_train[0][0,:])):
        (tvalue[i],pvalue[i])=stats.ttest_ind(POS[:,i],NEG[:,i])
        dataDict[i]=pvalue[i]
    tempRank=[i for i in dataDict.items()]
    rank=np.asarray(sorted(tempRank,key=lambda x:x[1]))
    return rank

    

def work(X_train_all, Y_train, X_test_all, Y_test, rank, num):
    Acc_svm = [0.0, 1.0, -1.0]
    Acc_bys = [0.0, 1.0, -1.0]
    Acc_knn = [0.0, 1.0, -1.0]
    # tp_svm, fn_svm, fp_svm, tn_svm=[],[],[],[]
    # tp_bys, fn_bys, fp_bys, tn_bys=[],[],[],[]
    # tp_knn, fn_knn, fp_knn, tn_knn=[],[],[],[]
    eval_svm = []
    eval_bys = []
    eval_knn = []
    # Acc参数内存相关分类器的Acc的ave_of_sum、min和max
    for i in range(10):
        X_train = X_train_all[i][:, rank[:num, 0].astype(int)]
        X_test = X_test_all[i][:, rank[:num, 0].astype(int)]
        S = work_SVM(X_train, Y_train[i], X_test, Y_test[i])
        N = work_Nbayes(X_train, Y_train[i], X_test, Y_test[i])
        K = work_KNN(X_train, Y_train[i], X_test, Y_test[i])
        # getParm(K[0],K[1],K[2],K[3])
        Acc_S = (S[0]+S[3])/(S[0]+S[1]+S[2]+S[3])
        Acc_N = (N[0]+N[3])/(N[0]+N[1]+N[2]+N[3])
        Acc_K = (K[0]+K[3])/(K[0]+K[1]+K[2]+K[3])
        Acc_svm[0] += float(Acc_S)
        Acc_svm[1] = min(Acc_svm[1], float(Acc_S))
        Acc_svm[2] = max(Acc_svm[2], float(Acc_S))

        Acc_bys[0] += float(Acc_N)
        Acc_bys[1] = min(Acc_bys[1], float(Acc_N))
        Acc_bys[2] = max(Acc_bys[2], float(Acc_N))

        Acc_knn[0] += float(Acc_K)
        Acc_knn[1] = min(Acc_knn[1], float(Acc_K))
        Acc_knn[2] = max(Acc_knn[2], float(Acc_K))

        # S1 = [sp,sn,Acc,Mcc,Avc]
        S1 = get_Parm(S[0], S[1], S[2], S[3])
        N1 = get_Parm(N[0], N[1], N[2], N[3])
        K1 = get_Parm(K[0], K[1], K[2], K[3])
        eval_svm.append(S1)  # S=[tp, fn, fp, tn]
        eval_bys.append(N1)
        eval_knn.append(K1)

    Acc_svm[0] /= 10.0
    Acc_bys[0] /= 10.0
    Acc_knn[0] /= 10.0
    # [[1,2,3][][]]
    return Acc_svm, Acc_bys, Acc_knn, eval_svm, eval_bys, eval_knn

def eval_draw(y_tmp, i):
    a, b, c = [], [], []
    eval_svm = np.array(y_tmp[3])
    a.append(eval_svm.mean(axis=0))
    a.append(eval_svm.min(axis=0))
    a.append(eval_svm.max(axis=0))

    eval_bys = np.array(y_tmp[4])
    b.append(eval_bys.mean(axis=0))
    b.append(eval_bys.min(axis=0))
    b.append(eval_bys.max(axis=0))

    eval_knn = np.array(y_tmp[5])
    c.append(eval_knn.mean(axis=0))
    c.append(eval_knn.min(axis=0))
    c.append(eval_knn.max(axis=0))
    pl = 221+i
    ax = plt.subplot(pl)
    z1 = np.array(a[0]) - np.array(a[1])
    z2 = np.array(a[2]) - np.array(a[0])

    z3 = np.array(b[0]) - np.array(b[1])
    z4 = np.array(b[2]) - np.array(b[0])

    z5 = np.array(c[0]) - np.array(c[1])
    z6 = np.array(c[2]) - np.array(c[0])

    yerr1 = [z1, z2]
    yerr2 = [z3, z4]
    yerr3 = [z5, z6]

    x = np.arange(5)
    width = 0.2
    labels = ['Sp', 'Sn', 'Acc', 'Mcc', 'Avc']
    ax.bar(x, a[0], color='red', width=width, yerr=yerr1, label='SVM')
    ax.bar(x+width, b[0], color='blue', width=width,
           yerr=yerr2, label='Nbayes', tick_label=labels)
    ax.bar(x+2*width, c[0], color='green',
           width=width, yerr=yerr3, label='KNN')
    ax.legend(loc='best')
    name = 'Top '+str(10**i)+' Features'
    ax.set_title(name)

def line_graph_draw(x,y):
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

    plt.errorbar(x,y[:,0,0],yerr=yerr1,capsize=5,capthick=3,color='red')
    plt.errorbar(x,y[:,1,0],yerr=yerr2,capsize=5,capthick=3,color='green')
    plt.errorbar(x,y[:,2,0],yerr=yerr3,capsize=5,capthick=3,color='blue')

    plt.xlabel("Number of features", fontsize=12)
    plt.ylabel("Accuracy", fontsize=12)
    name='Line Graph of Accuracy'
    plt.legend()
    plt.savefig(name+'.jpg') 
    plt.show()

def heat_map_draw(x,y):#y的结构[选取个数，分类器编号，ave、min、max]
    Acc=[y[:,0,0],y[:,1,0],y[:,2,0]]
    ylabels = ['SVM','NBayes','KNN'] 
    name='Heatmap of Accuracy'
    # # plt.figure(figsize=(100,100))
    # ax=plt.subplot(121)
    # ax.imshow(Acc, cmap=plt.cm.hot_r, vmin=0, vmax=1.0)
    # # plt.xticks([i for i in range(0,num,10)],[i+1 for i in range(0,num,10)])
    # ax.set_xticks(x,x)
    # ax.set_yticks(list(range(len(ylabels))),ylabels)
    # # plt.xticks(fontsize=100)
    # # plt.yticks(fontsize=50)
    # # plt.title(name,fontdict={'weight':'normal','size': 100})
    # plt.title(name)
    # ax=plt.subplot(122)
    # ax.colorbar(ticks=np.linspace(0,1.0,11))
    # plt.savefig(name+'.jpg')
    # plt.show()seaborn.diverging_palette(20, 220, n=200)
    seaborn.heatmap(Acc,vmin=np.min(Acc),vmax=np.max(Acc),cmap=plt.cm.hot_r,xticklabels=x,yticklabels=ylabels,cbar=True)
    plt.title(name)
    plt.savefig(name+'.jpg')
    plt.show()

def tradition():
    train_path = './dataset/training_set'
    test_path = './dataset/test_set'

    # img=load_img(train_path + "/cats/cat.1001.jpg")

    X = []  # 定义图像路径
    Y = []  # 定义图像分类类标
    Z = []  # 定义图像像素

    X_train_all,Y_train,X_test_all,Y_test = pre_work(train_path,test_path)
    rank = featureRank(X_train_all,Y_train)
    x,y=[],[]#y[数量,AccSNK]

    plot_backend = plt.get_backend()
    mng = plt.get_current_fig_manager()
    if plot_backend == 'TkAgg':
        mng.resize(*mng.window.maxsize())
    elif plot_backend == 'wxAgg':
        mng.frame.Maximize(True)
    elif plot_backend == 'Qt4Agg':
        mng.window.showMaximized()
    for i in range(4):
        x_tmp = 10**i
        y_tmp = work(X_train_all, Y_train, X_test_all, Y_test, rank, x_tmp)
        eval_draw(y_tmp, i)
    name='Histograms with error bar'
    plt.savefig(name+'.jpg',bbox_inches='tight') 
    plt.show()

    for i in range(20):
        # x_tmp=10*i+1
        x_tmp=(10*i+1)
        y_tmp=work(X_train_all,Y_train,X_test_all,Y_test,rank,x_tmp)
        x.append(x_tmp)
        y.append(y_tmp[0:3])
    
    x=np.array(x)
    y=np.array(y)

    line_graph_draw(x,y)
    heat_map_draw(x,y)




tradition()


 