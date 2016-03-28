library(dplyr) # 載入套件

# 請修改xxx, yyy 以計算 cricket_color 這筆資料，
# 對不同板球顏色 (color) 分別計算移動初速 (speed) 的
# 平均數 (mean) 與標準差 (sd)
# 並將結果指向 out
out <- group_by(cricket_color, color) %>%
  summarise(mean=mean(speed), sd=sd(speed))

stopifnot("data.frame" %in% class(out))
stopifnot(round(out[1,2],4) == 156.6667)
stopifnot(round(out[2,2],4) == 111.0000)
# 完成後，請存檔並回到console輸入`submit()`
