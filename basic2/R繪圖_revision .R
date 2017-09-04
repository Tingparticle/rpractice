#繪圖
rm(list = ls())
#--------------------------------------------------------------------
#data:iris(內建) 
iris
iris = iris
#iris:
#      Sepal.Length:花萼長度
#      Sepal.Width:花萼寬度
#      Petal.Length:花瓣長度
#      Petal.Width:花瓣寬度    
#      Species:類別，可分為Setosa，Versicolor和Virginica三個品種

#資料摘要
summary(iris)
#plot:data.frame格式
plot(iris) 
plot(Sepal.Length)
plot(iris$Sepal.Length)
#使用attach
attach(iris)
plot(Petal.Length, main = "Petal.Length")
#plot畫線:水平(horizontal)、垂直(vertical)
abline(h = 4, col = 2)
abline(v = 20, col = 3)
#plot畫線:斜線 y = ax+b abline(a= , b= )
abline(2, 1, col = 5)
abline(2, 0.01, col = 6)
#一個視窗幾個圖 par(mfrow=c( , ))
par(mfrow = c(2, 2))

#plot比較 
plot(Petal.Length)
plot(Petal.Length, type = "l")
plot(Petal.Length, type = "s")
plot(Petal.Length, type = "h")

#plot 散佈圖比較
par(mfrow = c(2, 3))
plot(Petal.Length, Sepal.Width, main = "scatter plot", col = 2)
plot(Petal.Length, Sepal.Width, main = "Scatter Plot", col = 3,
     xlab = "x", ylab = "y")
plot(Petal.Length, Sepal.Width, main = "Scatter Plot", col = 4,
     xlab = "x", ylab = "y", xlim = c(0, 8), ylim = c(0, 6))
plot(Petal.Length, Sepal.Width, col = 5, main = "Scatter Plot"
     , pch = 2)
plot(Petal.Length, Sepal.Width, col = 6, main = "Scatter Plot"
     , pch = 3)

#hist直方圖 hist(變數名稱)
par(mfrow = c(2, 2))
hist(Sepal.Length, col = 4)
hist(Sepal.Length, col = 3, main = "wow")
hist(Sepal.Length, col = 3, main = "wow", xlab = "length", ylab = "F")
hist(Sepal.Length, col = 3, main = "wow", xlab = "length",
     ylab = "F", xlim=c(0,10), ylim = c(0,50))

#qqnorm常態機率圖  qqnorm(變數名稱) 畫出常態分配圖看看是否是常態分配
par(mfrow = c(1, 1))
qqnorm(Sepal.Length)
qqline(Sepal.Length, col = 2)

#boxplot盒鬚圖 boxplot(變數名稱)
par(mfrow = c(2, 2))
boxplot(Sepal.Length, main = "Sepal.Length")
boxplot(iris)
boxplot(iris[, 1:4], main = "iris")
iris
boxplot(Sepal.Length~Species, xlab = "category", ylab = "length",
        main = "Species~Sepal.Length")

#barplot長條圖 barplot(變數名稱)
par(mfrow = c(1, 3))
class = table(Species)
class
barplot(class)
barplot(class, main = "Species barplot")
barplot(class, main = "Species barplot", col = c(1, 2, 3))

##pie圓餅圖
 par(mfrow = c(2, 2))
 #table():可以計算每個類別裡的個數
 table(Species)
 class = table(Species)
 #畫圖 pie(變數名稱)
 pie(class, main = "Species")
 pie(class, label = c(1, 2, 3), main = "Species")
 #使用round():四捨五入，預設四捨五入到整數
  round(3.14)
  round(3.14, 1)
 #計算百分比
  percent = round(class/sum(class)*100)
  percent
 #names():列出類別變數名稱
  names(class)
 #使用paste
  lbls = paste(percent, "%")
 #畫圓餅圖列出百分比
  pie(class, labels = lbls, main = "Species")
 #畫圖列出類別名稱、列出百分比
  lbls = paste(names(class), percent, "%")
 #畫圓餅圖列出百分比，改變圖形顏色
  pie(class, labels = lbls, main = "Species", col = c(2 ,3 ,4))

#ggplot
#ggplot繪圖相關網站：
#https://blog.gtwang.org/r/ggplot2-tutorial-basic-concept-and-qplot/
#install.packages("ggplot2")
library("ggplot2")






