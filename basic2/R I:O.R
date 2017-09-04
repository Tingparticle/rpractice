# 更改預設路徑設定
getwd()
setwd("/Users/80005099/Projects/教學文件/R語言/教學/Section2.資料的輸入與輸出/")

test.read.csv <- read.csv(file = "t-csv.csv", stringsAsFactors = F)
str(test.read.csv)
test.read.table <- read.table("t-csv.csv", header = T, sep = ",")
str(test.read.table)
?read.table

# setwd("/Users/80005099")
write.table(test.read.table, file = "/Users/80005099/test.txt", sep = ",", quote = F, row.names = F, append = T)
write.csv(test.read.csv, "/Users/80005099/test.csv", row.names = F)
?write.csv

save(test.read.csv, file = "/Users/80005099/test.rdata")
rm(test.read.csv) # 先移除test.read.csv，之後以load rdata的方式讀取回來
load("test.rdata")

# json 格式資料讀取與輸出
# 安裝jsonlite package
library(jsonlite)
test.json <- toJSON(test.read.csv)
fromJSON(test.json)

# jsonlines讀取方法 
# 使用fromJSON()會報錯
jsonline <- stream_in(con = file("t-jsonline.json"))

# 出現亂碼的解決方法： 
# 一、在R studio內設定語系（每次都要做）
Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8")
# 二、透過Terminal設定R language的語系（一勞永逸） 
# 1.打開Terminal 2.貼上 defaults write org.R-project.R force.LANG zh_TW.UTF-8 這串文字 3. 重啟Rstudio