#以向量形式录入表1-1中的数据----
names <- c("张青松","王宇翔","田思雨","徐丽娜","张志杰","赵颖颖","王志强","宋丽媛","袁芳芳","张建国")
stat <- c(68,85,74,88,63,78,90,80,58,63)
math <- c(85,91,74,100,82,84,78,100,51,70)
mark <-c(84,63,61,49,89,51,59,53,79,91)
mana <- c(89,76,80,71,78,60,72,73,91,85)
acco <- c(86,66,69,66,80,60,66,70,85,82)


#将向量形式的数据组织成数据框形式----
tabe1_1 <-data.frame(学生姓名=names, 统计学=stat, 数学=math ,营销学= mark,管理学=mana,会计学=acco)  #将数据组织成数据框的形式，并存储在对象table1_1中
tabe1_1


#---------------------报错
#将向量形式的数据组织成矩阵形式----
matrix1_1 <-matrix(cbind(stat,math,mark,acco),ncol = 5) #按列合并各门课程为矩阵形式，并存储在对象matrix1_1中
dimnames(matrix1_1) <- list(c("张青松","王宇翔","田思雨","徐丽娜","张志杰","赵颖颖","王志强","宋丽媛","袁芳芳","张建国"),c("统计学","数学","营销学","管理学","会计学")) #列出矩阵的行名称和列名称
save(matrix1_1,file="C:/example/ch1/matrix1_1.RData")   #保存矩阵matrix1_1
matrix1_1


#读取指定目录下的R数据文件----
load("C:/example/ch1/table1_1.RData")                 #读取R格式数据文件table1_1


#读取csv文件----
#读取包含标题的csv文件
read.csv("C:/example/ch1/table1_1.csv")

#读取不包含标题的csv文件
read.csv("C:/example/ch1/table1_1.csv",header = FALSE)


#导入Excel和SPSS数据----
#导入Excel数据
install.packages("xlsx")                #安装包xlsx
library(xlsx)                           #加载包xlsx
table1_1 <- read.xlsx("C:/example/ch1/table1_1.xlsx",as.data.frame=TRUE )           #导入EXCEL数据

#导入SPSS数据
install.packages("foreign")            #安装包foreign
library(foreign)                       #加载包foreign
table1_1 <- read.spss(file = "C:/example/ch1/table1_1.sav",use.value.labels = TRUE ,as.data.frame =TRUE )      #导入SPSS数据


#将数据保存为R格式和csv格式----
#将table1_1保存为R格式文件
save(table1_1,file = "C:/example/ch1/table1_1.RData")

#将table1_1保存为csv格式
write.csv(table1_1,file = "c:/example/ch1/table1_1.csv")


#在R中查看数据----
load("C:/example/ch1/table1_1.RData")          #加载数据框table1_1
table1_1                                       #查看数据框table1_1的全部数据
head(table1_1,3)                               #查看数据框table1_1的前3行数据
tail(table1_1)                                 #查看table1_1的最后据行数据（默认是6行）


#对数据框进行排序----
#按学生姓名的第一个字母升序排列 
newdata <- table1_1[order(table1_1$学生姓名),]             #存储在newdata中
newdata

#按统计学成绩降序排序
newdata1 <-tabe1_1[order(table1_1$统计学,decreasing=TRUE),]
#或 newdata1 <- table1_1[order(-table1_1$统计学),]
newdata1

#注：使用sort(x,decreasing=FALSE,..)函数也可以对数据进行排序，其中的x为向量或者因子.decreasing=FALSE 为默认的排序方式，即升序，降序排列时设定 decreasing=TRUE


#选定数据框table1_1中的特定变量进行分析----
load("C:/example/ch1/table1_1.RData")
mean(table1_1$统计学)                   #统计学求平均数
mean(table1_1[,2])                      #选定table1_1的第二列求平均数


#矩阵的简单计算----
load("C:/example/ch1/matrix1_1.RData")
colSums(matrix1_1[,1:5])                                         #对矩阵matrix1_1的第一列到第五列求和
rbind(matrix1_1,totals=colSums((matrix1_1[,1:5])))               #将求和结果加到原矩阵
rowSums(matrix1_1)                                               #对矩阵各行求和
mean(matrix1_1)                                                  #对举证中的所有数据求平均数


#使用apply函数对矩阵做简单计算----
apply(matrix1_1,1,sum)                                           #对矩阵所有行求和，中间参数为1
apply(matrix1_1,2,sum)                                           #对矩阵所有列求和，中间参数为2
apply(matrix1_1,1,mean)                                          #对矩阵所有行求平均数，中间参数为1
apply(matrix1_1,1,mean)                                          #对矩阵所有列求平均数，中间参数为2
apply(matrix1_1,2,sd)                                           #对矩阵所有列求标准差，中间参数为2


#将变量重新命名----
load("C:/example/ch1/matrix1_1.RData")
library(reshape)
rename(table1_1,c(学生姓名="姓名",统计学="统计"))






























