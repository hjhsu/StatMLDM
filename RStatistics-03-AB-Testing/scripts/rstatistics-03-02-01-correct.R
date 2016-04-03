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
