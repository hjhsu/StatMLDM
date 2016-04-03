set.seed(1)    # 給定亂數生成種子
runs <- 100000   # 模擬次數

n_a <- xxx # 請填入版本A的瀏覽次數
k_a <- xxx # 請填入版本A的註冊次數

n_b <- yyy # 請填入版本B的瀏覽次數
k_b <- yyy # 請填入版本B的註冊次數

# 生成版本A與B的隨機變數
a.samples <- rbeta(runs, k_a+1, n_a-k_a+1)
b.samples <- rbeta(runs, k_b+1, n_b-k_b+1)

mc.pvalue <- sum(a.samples > b.samples)/runs

stopifnot(class(mc.pvalue) == "numeric")
# 完成後，請存檔並回到console輸入`submit()`