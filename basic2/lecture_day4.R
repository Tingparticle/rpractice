
rm(list = ls())

#---------day4-----------#
#combine two dataframe
#建立一個data.frame叫做Ａ
A = data.frame(id = c(1, 3, 5), A_val = c('a', 'x', 'c'))
A
#建立一個data.frame叫做Ｂ
B = data.frame(id = c(3, 5, 6), B_val = c('x', 'y', 'z'))
B
#將Ａ和Ｂ的欄位命名
colnames(A) = colnames(B) = c('id', 'val')
#列合併
rbind(A, B)
#欄合併
cbind(A, B)

#subset
#Ａ與Ｂ的交集
#subset(物件, 回傳值為Ｔ/Ｆ的篩選條件)
#篩選條件是針對“列”
# %in% means any match in
# == means equal to
subset(A, (A$id %in% B$id & A$val %in% B$val))
#Ａ扣除與Ｂ相同的部分
subset(A, ! (A$id %in% B$id & A$val %in% B$val))
#Ｂ扣除與Ａ相同的部分
subset(B, ! (B$id %in% A$id & B$val %in% A$val))

#cut
#拆解數列並回傳切斷的區間
#創造一數列為30到80，其中間格為10
num = seq(30, 80, by = 10)
#cut(數列，breaks = 切幾段)
#預設為右關左開
c1 = cut(num, breaks = 4)
c1
#計算各fator的次數
table(c1)

#split
#拆解數列
#創造一個matrix叫做ma
ma = cbind(x = 1:10, y = (-4:5)^2)
#split(物件，分群的條件)
#col回傳欄位數
split(ma, col(ma))

##practice
data = iris
#1.subset Species which equal to versicolor from data

#2.according #1.,cut Sepal.Width into 4 parts
# and count how many times it has between 2.35 and 2.7


