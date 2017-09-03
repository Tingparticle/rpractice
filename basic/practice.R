
#1.先看看資料全貌感＃

rm(list=ls())
#rm(model15)#

data()
data(iris)
mean(iris$Sepal.Length)

df <- as.data.frame(iris)
df
View(df)
df1 <- df[,-c(2,3,4,5)]
df1
View(df1)
mean(df1)
sd(df1)
hist(df1)

View(iris)

#資料整理＃
split(iris, c(sample(rep(1:2, 75))))
sample(rep(1:2, 75))


#2.迴歸分析＃

df[,5] <- factor(df$Species)
model1 <- lm(Sepal.Width~Sepal.Length+factor(Species), data = iris)
#dummy variable，在LM中直接加上factor，若不在LＭ中則指示變因子不會變dummy variable#
model1
summary(model1)
#F-statistic，以判斷該模型中的全部或一部分參數是否適合用來估計母體。#
#z-score，t-score數據標準化#
#第一四分位數 (Q1)，又稱「較小四分位數」，等於該樣本中所有數值由小到大排列後第25%的數字。#
#t value = 測試統計#
#使用的模式與這些量測數據有多大的符合性？R2愈接近1.0愈好。#

anova(model1)
#Q1?#

#殘差分析＃

r = residuals(model1)
r
mean(r)
plot(r)
par(mfrow = c(2,3))
#可畫2X3的圖#
shapiro.test(r)
#常態性#
bptest(r)
#均質性，library("lmtest")，ex殘差均勻分布在-2~2之間，故我們可以推論殘差具有均質性。#
durbinWatsonTest(r)
#獨立性，library("car")#

#殘差分析＃

full <- lm(Sepal.Width~., data = iris)
summary(full)

null <- lm(Sepal.Width~1, data = iris)
summary(null)

#逐步回歸#

#向前#
model2 <- step(null, scope = list(lower = null, upper = full), direction = "forward", data = iris)

#向後#
model3 <- step(full, direction = "backward", data = iris)

#逐步＃
model4 <- step(null, scope = list(lower = null, upper = full), direction = "both", data = iris)

#預測#

model5 <- predict(full, iris)
model5
summary(model5)


#iris 落後期數用aic判斷最適合模型#

Sepal.Width <- iris$Sepal.Width[-c(77:150)][-1]
iris_train <- cbind(iris[-c(76:150),-2], Sepal.Width)
iris_test <- iris[c(76:150),]
iris_test[c(25:75),5] <-"versicolor"

model6 <- AIC(lm(Sepal.Width ~ Sepal.Length + Petal.Length + Petal.Width + factor(Species), data = iris_train))

model6

model7 <- lm(Sepal.Width ~ Sepal.Length + Petal.Length + Petal.Width + factor(Species), data = iris_train)

model8 <-predict(model7, iris_test[,-2])

summary(model8)

#iris 落後期數用aic判斷最適合模型#


#迴歸分析＃


#3.資料結構#


#屬性#
#character：用 "" 包起來，numeric，integer，complex，logical：True 或 False#

class('test')

as.integer('test')
#Warning message:強制變更過程中產生了 NA #

as.integer(10.3)
as.integer(10.3+2i)
#Warning message:強制變更時丟棄了虛數部分 #

is.integer(10.3)
#FALSE#



#數值運算#

2**3
8%/%2
8%%2

sign(12)
sign(0)
sign(-2)

log(2)
log(10,2)
log2(10)
log10(2)
log(2,10)


#變數與資料#
#character > complex > numeric > integer > logical#

b <- c(j = c(10,20), v = 13, d = 25)
b[1]
b[2]
b[[2]]
b[["j1"]]
b["j2"]
b[["v"]]

attributes(b)
names(b)

seq(1:5)
seq(1,5, 0.2)

rep(c(1,2), times = 3, each = 2)


#c(3, 4, 2) +-*/ c(3, 4, 2)，array也可以#


length(b)
sum(b)
cumsum(b)
cumprod(b)
prod(b)
sort(b)
rank(b)
order(b)



c <- c(1,2,3)
d <- c(4,5,6)

rbind(c,d)
cbind(c,d)

e <- array(c,c(2,3))
array(c,c(1,1))
array(c)

ncol(e)
nrow(e)

aperm(e)


#矩陣#
f <- matrix(c(1:3), nrow = 4, ncol = 3, byrow = TRUE)
f
t(f)
#轉至#
f %*% t(f)
diag(f)
det(f)
solve(f)
#反矩陣#
eigen(f)
rownames(f) <- LETTERS[1:4]
colnames(f) <- letters[1:3]
f

#factors#
factor(f)
factor(f, labels = c("e","r","z"), ordered = TRUE)
factor(f, exclude = NA)

#is.factor(), as.factor(), isorder(), as.ordered()#

which(f == 2)



name <- c("Joe", "Bob", "Vicky")
age <- c("28", "26", "34")
gender <- c("Male","Male","Female")
df2 <- data.frame(name, age, gender)
df3 <- data.frame(name)
#跟as.data.frame比較#


head(iris)
names(iris)
summary(iris)

#資料匯入與輸出#





#4.kmeans#

plot(formula = Petal.Length ~ Petal.Width , data = iris, col = iris$Species)

data <- iris[,-5]
km <- kmeans(data, centers = 3, nstart = 10)
plot(formula = Petal.Length ~ Petal.Width , data = data, 
     col = km$cluster, main = "將花做分群", xlab = "花寬度", ylab = "花長度", family = 'STKaiti')
#字是亂碼加入 family = 'STKaiti'#
library(ggplot2)
ggplot(data, aes(x = Petal.Width, y = Petal.Length)) + 
         geom_point(aes(color = factor(km$cluster))) +
         stat_density2d(aes(color = factor(km$cluster)))
#小心刮號#

ggplot(data, aes(x = Petal.Width, y = Petal.Length)) + 
  geom_point(aes(color = factor(data$Sepal.Width))) +
  stat_density2d(aes(color = factor(data$Sepal.Width)))

ggplot(data, aes(x = Petal.Width, y = Petal.Length)) + 
  geom_point(aes(color = factor(km$cluster))) 

ggplot(data, aes(x = Petal.Width, y = Petal.Length)) + 
  stat_density2d(aes(color = factor(km$cluster)))

wss <- km$tot.withinss
bss <- km$betweenss
tss <- wss + bss
ration <- wss / tss
ration


klist <- seq(1:10)
knnfunction <- function(x){
  kms <- kmeans(data, centers = x, nstart = 1)
  ratio <- kms$tot.withinss/(kms$tot.withinss+kms$betweenss)
}

rations <- sapply(klist, knnfunction)
rations

df <- data.frame(
  kv = klist, KMratio = rations)
df

ggplot(df, aes(x = kv, y = KMratio, label = kv, color = KMratio)) +
  geom_point(size = 5) + geom_text(vjust = 2)


flow_cluster <- kmeans(data, centers = 3, nstart = 10)
flow_cluster

#5.隨機森林#

iris_train1 <- iris[-c(76:150),-5]
iris_test1 <- iris_test[,-5]

klist <- seq(1:10)
knnfunction <- function(x){
  kms <- kmeans(iris_train1, centers = x, nstart = 10)
  ratio <- kms$tot.withinss/(kms$tot.withinss+kms$betweenss)
}


rations <- sapply(klist, knnfunction)
rations

df <- data.frame(
  kv = klist, KMratio = rations)
df

ggplot(df, aes(x = kv, y = KMratio, label = kv, color = KMratio)) +
  geom_point(size = 5) + geom_text(vjust = 2)

flow_cluster <- kmeans(iris_train1, centers = 3, nstart = 10)

iris_train1[,5] <- as.factor(flow_cluster$cluster)
iris_train1
colnames(iris_train1)[5] = "flow_cluster"

library(randomForest)
rf_model <- randomForest(flow_cluster ~ Sepal.Width + Sepal.Length + Petal.Length +
                           Petal.Width,data = iris_train1, ntree = 500)

rd_pre <- predict(rf_model, iris_test1)
rd_pre















