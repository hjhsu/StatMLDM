set.seed(1)    # 給定亂數生成種子
N    <- 30     # 模擬時間長度
mR   <- xxx    # 修改xxx, 計算AAPL.returns的平均數
sdR  <- xxx    # 修改xxx, 計算AAPL.returns的標準差


# 請執行股價的蒙地卡羅模擬
# Hint: P_t = P_t−1 * exp(R_t)
#       P_t = P_0 * prod(exp(R_t))
#       P_t = P_0 * exp(cumsum(R_t))

P0 <- tail(AAPL.price,1) # 設定模擬起始時間，為最後一筆股價
Rt <- rnorm(n=xxx, mean=xxx, sd=xxx) # 修改xxx, 生成AAPL.returns的常態分佈隨機變數
Pt <- xxx # 請同學依照Hint生成股價模擬數據

plot(Pt, type="l")     # 畫出預測結果

# 請注意保持起始亂數種子 set.seed(1)，已通過syopifnot的驗證
stopifnot(length(Rt) == N)
stopifnot(class(Pt) == "numeric")
stopifnot(length(Pt) == N)
# 完成後，請存檔並回到console輸入`submit()`
