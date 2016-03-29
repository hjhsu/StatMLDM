# 請練習使用 dplyr::filter 
# 選出時間介於 2015-05-24到2015-08-23的資料
# Hint: as.Date(date) >= as.Date("2015-05-24)
game1 <- filter(game, as.Date(date) >= as.Date("2015-05-24"), 
                as.Date(date) <= as.Date("2015-08-23"))

# 執行兩方案對value的A/B測試
# 請修改formula成適當內容
# Note: alternative="less" 表示單尾檢定，請見help(t.test)
test3 <- t.test(value~method, data=game1, alternative="less")
test3

stopifnot(round(test3$p.value,5)==0.00016)
# 完成後，請存檔並回到console輸入`submit()`

