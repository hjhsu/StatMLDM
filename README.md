# StatMLDM

我用來教授統計、機器學習與資料探勘的教材

## 安裝Swirl課程

- 請檢查是否使用`http://wush978.github.io`上的swirl套件：

```
tryCatch({
  # Error if we need to install swirl
  if (!"swirl" %in% rownames(installed.packages())) stop("install swirl")
  if (packageVersion("swirl") < package_version("101.3.1.5")) stop("install swirl")
}, error = function(e) {
  if (conditionMessage(e) == "install swirl") {
    install.packages("swirl", repos = "http://wush978.github.io/R")
  }
})
```

- 載入swirl，並且安裝課程
```
library(swirl)
install_course_github("wush978", "StatMLDM", "course")
```

- 如果安裝有問題，請清空過往課程
```
library(swirl)
delete_progress("user_name") # 修該user_name成為同學的暱稱
uninstall_all_courses() # 移除所有舊課程
install_course_github("wush978", "StatMLDM", "course")
```

## 課程投影片

- [Statistics](http://wush978.github.io/StatMLDM/slide/Statistics.html)

## 課程筆記(版本：fd25508a)

- [RDataMining-01-Association-Rule](http://wush978.github.io/StatMLDM/note/RDataMining-01-Association-Rule.html)
- [RDataMining-02-Clustering](http://wush978.github.io/StatMLDM/note/RDataMining-02-Clustering.html)
- [RDataMining-03-Classification](http://wush978.github.io/StatMLDM/note/RDataMining-03-Classification.html)
- [RDataMining-04-Text-Mining](http://wush978.github.io/StatMLDM/note/RDataMining-04-Text-Mining.html)
- [RMachineLearning-01-Linear-Model](http://wush978.github.io/StatMLDM/note/RMachineLearning-01-Linear-Model.html)
- [RMachineLearning-02-Generalized-Linear-Model](http://wush978.github.io/StatMLDM/note/RMachineLearning-02-Generalized-Linear-Model.html)
- [RMachineLearning-03-Regularization](http://wush978.github.io/StatMLDM/note/RMachineLearning-03-Regularization.html)
- [RMachineLearning-04-Support-Vector-Machine](http://wush978.github.io/StatMLDM/note/RMachineLearning-04-Support-Vector-Machine.html)
- [RMachineLearning-05-Decision-Tree](http://wush978.github.io/StatMLDM/note/RMachineLearning-05-Decision-Tree.html)
- [RMachineLearning-06-Gradient-Boosted-Decision-Tree](http://wush978.github.io/StatMLDM/note/RMachineLearning-06-Gradient-Boosted-Decision-Tree.html)
- [RMachineLearning-07-Challenge](http://wush978.github.io/StatMLDM/note/RMachineLearning-07-Challenge.html)
- [RStatistics-01-EDA](http://wush978.github.io/StatMLDM/note/RStatistics-01-EDA.html)
- [RStatistics-02-MonteCarlo](http://wush978.github.io/StatMLDM/note/RStatistics-02-MonteCarlo.html)
- [RStatistics-03-AB-Testing](http://wush978.github.io/StatMLDM/note/RStatistics-03-AB-Testing.html)
