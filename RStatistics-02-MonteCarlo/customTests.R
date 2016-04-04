# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

script_test_prefix <- function(n = 2) {
  e <- get("e", parent.frame(n = n))
  source_result <- try(source(e$script_temp_path, local = new.env(), encoding = "UTF-8"), silent = TRUE)
  if (class(source_result)[1] == "try-error") stop(sprintf("Syntax error: %s", conditionMessage(attr(source_result, "condition"))))
  e
}

rstatistics_02_01_01 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of mc.integral ...\n")
    set.seed(1) # 給定亂數生成種子
    runs <- 1000   # 模擬次數

    # 請同學修改 xx 成適當的參數，以生成平均數=0, 標準差=10的常態分佈隨機變數
    sims <- rnorm(runs, mean=0, sd=10)

    # 請同學修改 yy 成適當的參數，以計算介於 (-10, 10)的機率總和
    mc.integral <- sum(sims >= -10 & sims <= 10)/runs
    cat("mc.integral =", mc.integral, "\n")
    if (!isTRUE(all.equal(mc.integral, e2$mc.integral ))) {
      stop("The generation of mc.integral  is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}

rstatistics_02_01_02 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of mc.integral.seq ...\n")
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
    mc.integral.seq <- sapply(X=runs, FUN=mcFun01)
    cat("mc.integral.seq =", mc.integral.seq, "\n")
    if (!isTRUE(all.equal(mc.integral.seq, e2$mc.integral.seq))) {
      stop("The generation of mc.integral.seq is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}

rstatistics_02_02_01 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of mc.pvalue ...\n")
    set.seed(1)    # 給定亂數生成種子
    runs <- 100000   # 模擬次數

    n_a <- 2981 # 請填入版本A的瀏覽次數
    k_a <- 343  # 請填入版本A的註冊次數

    n_b <- 2945 # 請填入版本B的瀏覽次數
    k_b <- 403  # 請填入版本B的註冊次數

    # 生成版本A與B的隨機變數
    a.samples <- rbeta(runs, k_a+1, n_a-k_a+1)
    b.samples <- rbeta(runs, k_b+1, n_b-k_b+1)

    mc.pvalue <- sum(a.samples > b.samples)/runs

    stopifnot(class(mc.pvalue) == "numeric")
    # 完成後，請存檔並回到console輸入`submit()`

    cat("mc.pvalue =", mc.pvalue, "\n")
    if (!isTRUE(all.equal(mc.pvalue, e2$mc.pvalue ))) {
      stop("The generation of mc.pvalue is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}

rstatistics_02_03_01 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    source(e$script_temp_path, local = e2)
    cat("Generating expected result of Pt ...\n")
    set.seed(1)    # 給定亂數生成種子
    N    <- 30     # 模擬時間長度
    mR   <- mean(AAPL.returns)    # 修改xxx, 計算AAPL.returns的平均數
    sdR  <- sd(AAPL.returns)    # 修改xxx, 計算AAPL.returns的標準差

    # 請執行股價的蒙地卡羅模擬
    # Hint: P_t = P_t−1 * exp(R_t)
    #       P_t = P_0 * prod(exp(R_t))
    #       P_t = P_0 * exp(cumsum(R_t))

    P0 <- tail(AAPL.price,1) # 設定模擬起始時間，為最後一筆股價
    Rt <- rnorm(n=N, mean=mR, sd=sdR) # 修改xxx, 生成AAPL.returns的常態分佈隨機變數
    if (!isTRUE(all.equal(Rt, e2$Rt))) {
      stop("The generation of Rt is unexpected")
    }
    Pt <- P0*exp(cumsum(Rt)) # 請同學依照Hint生成股價模擬數據

    plot(Pt, type="l")     # 畫出預測結果

    # 請注意保持起始亂數種子 set.seed(1)，已通過syopifnot的驗證
    stopifnot(length(Rt) == N)
    stopifnot(class(Pt) == "numeric")
    stopifnot(length(Pt) == N)
    # 完成後，請存檔並回到console輸入`submit()`

    cat("Pt =", Pt, "\n")
    if (!isTRUE(all.equal(Pt, e2$Pt))) {
      stop("The generation of Pt is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}


rstatistics_02_03_02 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of Pt.arr ...\n")
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
    
    stopifnot(ncol(Pt.arr) == 10)
    stopifnot(nrow(Pt.arr) == 30)
    
    # 本檔案為範例頁面，請直接存檔並回到console輸入`submit()`
    

    # 本檔案為範例頁面，請直接存檔並回到console輸入`submit()`


    cat("Pt =", Pt, "\n")
    if (!isTRUE(all.equal(Pt.arr, e2$Pt.arr))) {
      stop("The generation of Pt.arr is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}
