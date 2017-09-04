
rm(list = ls())
library(data.table)

#---NA v.s NULL---#
#NA
#檢查資料是否有NA
#is.na(x) return T or F
#x is the object which u want to check whether has NA or not.
a = c(NA, 1, 2)
is.na(a)
#移除NA
#na.omit(x) = remove the NA
#x is the object which u want to remove NA from, typically a data frame
na.omit(data.frame(a))
#3.或把NA取代成0
a[is.na(a)] = 0

#NULL
b = NULL
is.null(b)
#由於NULL並不會佔據任何記憶體，因此不用特別針對NULL去處理
c = c(NULL, 1, 2)

#---資料合併---#
#data.table::merge
#merge(x, y, by.x, by.y, all)
#x, y data u want to merge
#by.x, by.y合併所要依據的變數
A = data.frame(id = c(1, 3, 5), A_val = c("a", "x", "c"))
A
B = data.frame(id = c(3, 5, 6), B_val = c("x", "y", "z"))
B
A_B = merge(x = A, y = B, by.x = "id", by.y = "id")
left_A_B = merge(x = A, y = B, by.x = "id", by.y ="id", all.x = T)
left_A_B
full_A_B = merge(x = A, y = B, by.x = "id", by.y = "id", all = T)
full_A_B

#---字串的合併與拆解---#
#paste
#paste(需要相連的物件, sep = " 字串間相連的形式")
#sep預設為空一格
paste(month.abb, letters)
#paste0(需要相連的物件)
#paste0與paste不同在於sep設定為""，也就是說要連接的字串間沒有空格
paste0(month.abb, letters)

#substr
#substr(x, start, stop)
#x is a character vector
#start從左邊數過來的第一個要切割的字元的位置
#stop從左邊數果來做後一個要切的字元的位置
substr("H1234", 2, 5)




