library(dplyr) # 載入套件

# 請修改xxx, yyy 以計算 cricket_color 這筆資料，
# 對不同板球顏色 (color) 分別計算移動初速 (speed) 的
# 平均數 (mean) 與標準差 (sd)
# 並將結果指向 out1
out1 <- group_by(xxx, yyy) %>%
  summarise(mean=xxx, sd=yyy)

stopifnot("data.frame" %in% class(out1))
stopifnot(round(out1[1,2],4) == 156.6667)
stopifnot(round(out1[2,2],4) == 111.0000)
# 完成後，請存檔並回到console輸入`submit()`
