#九九乘法
total = 0
total2 = NULL
#total3 = NULL
#total4 = NULL
for(i in 1:9){
  for(j in 1:9){
    total = i * j 
    #cat(total)
    #cat("\n")
    total2 = c(total2, total)
  }
    total3 = matrix(total2, nrow = 9, ncol = 9)
    #cat("\n")
    #total4 = c(total, total2)
}

matrix(total2, nrow = 9, ncol = 9)

View(total4)


tt3 = NULL
for(i in 1:9){
  tt2 = NULL
  for(j in 1:9){
    tt1 = i*j
    tt2 = c(tt2,tt1)
  }
   tt3 = rbind(tt3,tt2)
}
  

#  while(可繼續留在迴圈的邏輯判斷式)
#  {
#    一個或多個完整運算式
#  }