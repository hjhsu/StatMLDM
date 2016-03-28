set.seed(1)    # 給定亂數生成種子
runs <- 10   # 模擬次數
N    <- 30     # 模擬時間長度
mR   <- mean(AAPL.returns)    # 修改xxx, 計算AAPL.returns的平均數
sdR  <- sd(AAPL.returns)    # 修改xxx, 計算AAPL.returns的標準差

# 請執行股價的蒙地卡羅模擬
# Hint: P_t = P_t−1 * exp(R_t)
#       P_t = P_0 * prod(exp(R_t))
#       P_t = P_0 * exp(cumsum(R_t))

P0 <- tail(AAPL.price,1) # 設定模擬起始時間，為最後一筆股價

# 生成 runs 筆蒙地卡羅模擬結果
tmp <- rnorm(n=N*runs, mean=mR, sd=sdR)
Rt.arr <- matrix(tmp, ncol=runs)
Pt.arr <- apply(Rt.arr, 2, function(Rt)  P0*exp(cumsum(Rt)))

matplot(Pt.arr, type="l", col="grey", lty=1) # 畫出 runs 次模擬
lines(rowMeans(Pt.arr), type="l", lwd=1.5)   # 畫出平均模擬結果

stopifnot(round(rowMeans(Pt.arr)[1],4) == 106.1569)
stopifnot(round(rowMeans(Pt.arr)[N],4) == 111.7722)

# 本檔案為範例頁面，請直接存檔並回到console輸入`submit()`
