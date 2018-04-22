# SKsTools
基于四哥的 kstools（https://github.com/fourbrother/kstools） 修改， 转化成了 as 工程，集成了 java2smali，hook 源码便于修改！

## 1. 环境变量配置：
* 设置 JAVA_HOME、jarsigner 环境变量；
* 在 apksign.bat 或 execute.sh 中设置aapt工具目录；

## 2. 破解签名步骤：
### 2.1 加固 apk：
* 需要先将加固前的 apk 放到 ExecuteDir/input目录下，然后执行 apksign.sh(bat) 脚本运行获取签名信息，运行结束之后保存在 apksign.txt 中；
* 将修复之后的apk文件命名为 src.apk，放在当前目录下，直接运行再次 执行 execute.sh 即可;

Ps: 对于加固app有很多特殊情况，所以如果操作失败，可以自行编写代码获取加固app的签名信息，方法很多，自行网上搜索

### 2.2 非加固 apk：
* 将 apk ExecuteDir/input 目录下，命名为src.apk;
* 根据自己的平台执行 apksign.bat 或者 execute.sh 脚本；
* 签名后的文件在 ExecuteDir/output 目录中；


## 2.3 根据自身需要修改源码步骤：

* 修改 Hook 模块中的代码；
* execute.sh会自动执行 Java2Smali/executableDir/bin/java2smali.sh(bat) 脚本，生成 smali 文件拷贝到 ExecuteDir 目录中；
* 修改 KsToolsSrc 中的签名配置，execute.sh 脚本会自动生成 KsToolsSrc-1.0.jar，拷贝到 ExecuteDir/bin/jar 目录中；
* 重复执行 2.2 中的步骤；