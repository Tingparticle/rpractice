
#條件執行、迴圈
rm(list = ls())
#--------------------------------------------------------------------
#ifesle ifelse()
x = 3
y = ifelse(x>10, 1, 2)
y

x = c(-3:3)
sqrt(x) 
ifelse(x>= 0, sqrt(x), NA)

#  if(邏輯判斷式){
#       TRUE-運算式
#  }else{
#       FALSE-運算式
#  }

x = 5
if(x<3){
  y = 1
}else{
  y = 2
}
y

#  if(邏輯判斷式1){
#    一個或多個運算式
#  }else if(邏輯判斷式2){
#    一個或多個運算式
    ...........
#  }else if(邏輯判斷式k){
#    一個或多個運算式
#  }else{
#    一個或多個運算式
#  }  

grade=70

if(grade>=90){
  cat("A")
}else if(grade>=80 && grade<90){
  cat("B")
}else if(grade>=70 && grade<80){
  cat("C")
}else if(grade>=60 && grade<70){
  cat("D")
}else{
  cat("E")
}
    

#  for(迴圈變數 in 範圍){
#    單一完整運算式
#  }

total = 0
for (i in 1:10){
  total = total+i
  cat("i=",i, ",", "x<-x+i=",total, "\n")
}
total 

#九九乘法

for(i in 1:9){
  for(j in 1:9){
    cat(i,"*",j,"=",i*j,"\n")
  }
  cat("\n")
}

#  while(可繼續留在迴圈的邏輯判斷式)
#  {
#    一個或多個完整運算式
#  }

i = 1
total = 0
while(i<=10){
  total = total+i
  i = i+1
}
total
i
