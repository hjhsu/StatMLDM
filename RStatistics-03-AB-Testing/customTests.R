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

rstatistics_03_01_01 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of out1 ...\n")
    library(dplyr) # 載入套件

    # 請修改xxx, yyy 以計算 cricket_color 這筆資料，
    # 對不同板球顏色 (color) 分別計算移動初速 (speed) 的
    # 平均數 (mean) 與標準差 (sd)
    # 並將結果指向 out
    out1 <- group_by(cricket_color, color) %>%
      summarise(mean=mean(speed), sd=sd(speed))

    stopifnot("data.frame" %in% class(out1))
    stopifnot(round(out1[1,2],4) == 156.6667)
    stopifnot(round(out1[2,2],4) == 111.0000)
    # 完成後，請存檔並回到console輸入`submit()`

    out1
    if (!isTRUE(all.equal(out1, e2$out1))) {
      stop("The generation of mc.integral  is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}

rstatistics_03_02_01 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of AB Testing ...\n")
    # 範例2. 計算A/B測試的p值。
    # 考慮A、B兩種網頁排版方案，比較會員註冊的成效。
    # 在同一時間內隨機分派訪客進入A、B兩種排版的網頁，
    # A版本在2,981個瀏覽數中有343個註冊數；
    # B版本在2,945個瀏覽數中有403個註冊數。
    # A版本的轉換率為11.5%；B版本為13.7% 。

    # 生成 web log data
    a <- rep(c(1,0), c(343, 2981-343))
    b <- rep(c(1,0), c(403, 2945-403))
    out2 <- data.frame(method=rep(c("A","B"), c(2981,2945)),
                       value=c(a,b))

    tab <- table(out2)  # 印出交叉表
    tab

    # 請使用 t.test 執行轉換率A/B測試
    # 將 formula 修改成適當格式 xxx ~ yyy
    test1 <- t.test(value~method, data=out2)
    test1

    # 請使用 prop.test 執行轉換率A/B測試
    # 請將xxx, yyy修改後，執行prop.test
    test2 <- prop.test(x=c(343,403), n=c(2981,2945), correct=FALSE)
    test2

    stopifnot(round(test1$p.value,4) == 0.0115)
    stopifnot(round(test2$p.value,4) == 0.0115)

    # 完成後，請存檔並回到console輸入`submit()`

    if (!isTRUE(all.equal(test1, e2$test1))) {
      stop("The generation of AB Testing is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}

rstatistics_03_03_01 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    library(dplyr)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of AB Testing ...\n")

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


    if (!isTRUE(all.equal(test3, e2$test3))) {
      stop("The generation of AB Testing is unexpected")
    }
    TRUE
  }, error = function(e) {
    message(conditionMessage(e))
    FALSE
  })
}

rstatistics_03_03_02 <- function(){
  tryCatch({
    e <- script_test_prefix()
    e2 <- new.env()
    cat("Generating your result...\n")
    set.seed(1)
    library(dplyr)
    source(e$script_temp_path, local = e2, encoding = "UTF-8")
    cat("Generating expected result of AB Testing ...\n")

    # 請練習使用 dplyr::filter
    # 選出時間介於 2015-05-24到2015-11-22的資料
    # Hint: as.Date(date) >= as.Date("2015-05-24)
    game2 <- filter(game, as.Date(date) >= as.Date("2015-05-24"),
                    as.Date(date) <= as.Date("2015-11-22"))

    # 執行兩方案對value的A/B測試
    # 請修改formula成適當內容
    # Note: alternative="less" 表示單尾檢定，請見help(t.test)
    test4 <- t.test(value~method, data=game2, alternative="greater")
    test4

    stopifnot(round(test4$p.value,5)==0.09505)
    # 完成後，請存檔並回到console輸入`submit()`


    if (!isTRUE(all.equal(test4, e2$test4))) {
      stop("The generation of AB Testing is unexpected")
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

    stopifnot(round(rowMeans(Pt.arr)[1],4) == 106.1569)
    stopifnot(round(rowMeans(Pt.arr)[N],4) == 111.7722)

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
