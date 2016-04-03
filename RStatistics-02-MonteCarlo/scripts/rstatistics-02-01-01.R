set.seed(1)    # 給定亂數生成種子
runs <- 1000   # 模擬次數

# 請同學修改 xx 成適當的參數，以生成平均數=0, 標準差=10的常態分佈隨機變數
sims <- rnorm(runs, mean=xx, sd=xx)

# 請同學修改 yy 成適當的參數，以計算介於 (-10, 10) 的機率總和
mc.integral <- sum(sims >= yy & sims <= yy)/runs

stopifnot(class(mc.integral) == "numeric")

# 完成後，請存檔並回到console輸入`submit()`
