set.seed(1)    # 給定亂數生成種子
runs <- 10^(3:6)   # 模擬次數

# 這是一個給定參數 runs=模擬次數，即執行MC積分演算法的函數
mcFun01 <- function(runs){
  # 生成平均數=0, 標準差=10的常態分佈隨機變數
  sims <- rnorm(runs, mean=0, sd=10)
  # 計算介於 (-10, 10)的機率總和
  mc.integral <- sum(sims >= -10 & sims <= 10)/runs
  mc.integral
}

# 請同學修改 xx 與 yy 成適當的參數，計算不同模擬次數的MC積分結果
mc.integral.seq <- sapply(X=xx, FUN=yy)

stopifnot(class(mc.integral.seq) == "numeric")
stopifnot(length(mc.integral.seq) == "4")

# 完成後，請存檔並回到console輸入`submit()`
