#practice
data = iris
#1.Create an function that u want to do it again and again, which can find the
#second large Petal.Length among Species, called findseclarge.
#hint1:u should review how to use sort, order, length...etc
#hint2:nrow() return the number of rows
#when x is a data.frame, u can.....

findseclarge = function(x){
  split(x, cut(x$Species, break = c(setosa, virginica, versicolor)))
}


findseclarge = function(data1, c, s, secc){
  data2 = split(data1, data1$c)
  data3 = data2$s
  print(sort(data3[,secc], decreasing = T)[2])
}

#function中 data1$c無法讀到c ，iris$species ＯＫ

findseclarge(iris, "Species", "versicoloe", "petal.length")


findseclarge = function(data1, s, secc){
  tmpspe = data1[, s]
  data2 = split(data1, tmpspe)
  spesort = function(x){
    sort(data2[[x]][, 2], decreasing = T)[2]
  }
  sapply(1:3, spesort)
}

findseclarge(iris, 5, 2)


print(sort(data2[[1]][, 2], decreasing = T)[2])


#2.use #1. function to find second large Petal.Length among Species.


