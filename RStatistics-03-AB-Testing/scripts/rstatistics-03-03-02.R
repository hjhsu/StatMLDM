# 請練習使用 dplyr::filter 
# 選出時間介於 2015-05-24到2015-11-22的資料
# Hint: as.Date(date) >= as.Date("2015-05-24)
game2 <- filter(game, xxx, xxx)


# 執行兩方案對value的A/B測試
# 請修改formula成適當內容
# Note: alternative="less" 表示單尾檢定，請見help(t.test)
test4 <- t.test(formula, data=game2, alternative="greater")
test4

stopifnot(round(test4$p.value,5)==0.09505)
# 完成後，請存檔並回到console輸入`submit()`
