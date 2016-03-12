# StatMLDM

我用來教授統計、機器學習與資料探勘的教材

## 安裝Swirl課程

1. 請檢查是否使用`http://wush978.github.io`上的swirl套件：

```
tryCatch({
  # Error if we need to install swirl
  if (!"swirl" %in% rownames(installed.packages())) stop("install swirl")
  if (packageVersion("swirl") < package_version("2.3.1-4")) stop("install swirl")
}, error = function(e) {
  if (conditionMessage(e) == "install swirl") {
    install.packages("swirl", repos = "http://wush978.github.io/R")
  }
})
```

2. 載入swirl，並且安裝課程

```
library(swirl)
install_course_github("wush978", "StatMLDM", "course")
```
