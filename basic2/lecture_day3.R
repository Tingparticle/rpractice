

rm(list = ls())

#---------------day3------------#
#Filtering
#mtcars為內建資料
mtcars = mtcars
#grep為抓取特定形式的函式，會回傳具有特定形式的位置
#grep(pattern, 針對的資料)
mtcars[grep('Toyota', rownames(mtcars)), ]
#抓取特定欄位
mtcars[ , c("mpg", "hp", "wt")]
#針對條件mtcars$wt > 5，抓取特定欄位
mtcars[mtcars$wt > 5, c('mpg', 'wt')]

#sorting and ranking
#set.seed隨機變數的起始值設定
set.seed(1)
#產生五個為uniform分配的亂數
#min、max為分配的上下限
rand = runif(n = 5, min = 0, max = 1)
randrand
#排序
sort(rand)
#排名
rank(rand)
#回傳排序在原本數列的位置
order(rand)
#針對mtcars$wt排序，由大到小
a = mtcars[order(mtcars$wt, decreasing = T), c('mpg', 'wt')]
#針對mtcars$cyl及mtcars$wt排序，mtcars$cyl由小到大，mtcars$wt由大到小
b = mtcars[order(mtcars$cyl, -mtcars$wt), ]

# Removing duplicate records
#建造一個data.frame叫做dup
dup = data.frame(x1 = c('a', 'a', 'b', 'b', 'c'), x2 = c(1, 1, 2, 3, 4),  x3 = c(1, 1, 2, 3, 4))
dup
#duplicated會回傳是否有重複
dup_removed1 = dup[!duplicated(dup[,c(1,2)]), ]
dup_removed1
#unique排除重複值
dup_removed2 = unique(dup)
dup_removed2
#all.equal判斷兩個物件是否相同
all.equal(dup_removed1, dup_removed2)

#Deleting and adding columns/variables
#建造跟mtcars一樣的data叫data
data = mtcars
#把vs, am, gear, carb這四欄變數變為list()
mtcars[, c('vs', 'am', 'gear', 'carb')] = list()
mtcars
#取出data中欄位不是cyl, disp, drat, qsec這四個欄位的其他資料
data[, !colnames(data) %in% c('cyl', 'disp', 'drat', 'qsec')]
#增加新的欄位叫做newVar，內容為1到32
data$newVar = c(1:32)

#practice
#CO2為內建資料
data = CO2
#1.how many plants? and who are them?

#2.order uptake according to plant


