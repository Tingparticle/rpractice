
rm(list = ls())

#新增readxl這個package
setwd("~/Projects/Package/RPackage")
install.packages("readxl.tgz", repos = NULL, type = .Platform$pkgType)

#---day6---#
#function
#函式名稱 = function(輸入參數){
#   程式重複執行的部分
# } 
#建立一個叫做square的function，唯有二的倍數才需平方，否則回傳NA
# %%餘數
#return()回傳你要的物件，若沒設定會回傳最後執行的動作
square = function(x){
  return(ifelse(x %% 2 == 0, x^2, NA))
}
square(3)
square(8)

#Variable Scope in R
#在function內的變數並不會儲存在環境變數內
x = "global_x"
printXY = function(){
  y = "local_x"
  print(x)
  print(y)
}
printXY()
x
y

#在function內指定的變數並不會更改外在的變數
x = "global_x"
printX = function(x){
  print(x)
  x = "local_x"
  print(x)
}
printX(x)
x

#sapply
#sapply(x, FUN = function)
#將數列1到10做標準化
#標準化 = (數值 - 平均數) / 標準差
a = mean(1:10)
b = sd(1:10)

#以迴圈的方式計算1到10標準化的數字
#proc.time() - 初始時間 ＝整段程式的執行時間
#The ‘user time’ is the CPU time charged for the execution of user 
#instructions of the calling process. 
#The ‘system time’ is the CPU time charged for execution by the 
#system on behalf of the calling process.
#elapsed = user + system

#stt = proc.time()
ttl = NULL
for(i in 1:10){
  ans = (i - a) / b
  ttl = c(ttl, ans)
}
#proc.time() - stt

#以sapply的方式計算1到10標準化的數字
#sapply(x, FUN = function)
#x usually is a vector
#stt = proc.time()
sapply(1:10, function(x) (x - a) / b)
#proc.time() - stt

#apply
#apply(x, MARGIN, FUN = function)
#x ia an array, including matrix
#MARGIN = 1 indicates rows
#MARGIN = 2 indicates columns
m = matrix(1:16, ncol = 4)
apply(m, MARGIN = 1, FUN = sum) 
apply(m, MARGIN = 2, FUN = sum) 

#lapply
#lapply(x, FUN = function)
#x is a list
set.seed(1)
L = list(num = 1:10, randNum = runif(100, 0, 1))
L
lapply(X = L, FUN = mean)
#why use lapply? when input data is a list, we usually use lapply!
kv1 = split(mtcars, cut(mtcars$hp, breaks = c(0, 100, 200, Inf)) )
kv1
kv2 = lapply(kv1, FUN = function(x) return( mean(x$mpg)) )
kv2


#practice
data = iris
#1.Create an function that u want to do it again and again, which can find the
#second large Petal.Length among Species, called findseclarge.
#hint1:u should review how to use sort, order, length...etc
#hint2:nrow() return the number of rows
#when x is a data.frame, u can.....



#2.use #1. function to find second large Petal.Length among Species.



