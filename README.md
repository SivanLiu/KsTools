# SKsTools
基于四哥的 kstools 修改版本， 转化成了 as 工程，集成了 java2smali，hook 源码便于修改！

## 1. 破解签名步骤：

* 将源 apk 放在 ExecuteDir 中的 input 目录中；
* 设置 JAVA_HOME、jarsigner 环境变量，aapt 路径可以再 apksign.bat 或 execute.sh 中设置；
* 根据自己的平台执行 apksign.bat 或者 execute.sh 脚本；
* 签名后的文件在 ExecuteDir/output 目录中；


## 2. 根据需要修改源码签名步骤：

* 修改 Hook 模块中的代码，拷贝修改后的代码到 Java2Smali/executableDir/java 目录中；
* 根据平台，执行 Java2Smali/executableDir/bin/java2smali.sh(bat) 脚本，生成 smali 文件拷贝到 ExecuteDir 目录中；
* 修改 KsToolsSrc 中的签名配置，通过命令 gradle clean fatJar 生成 KsToolsSrc-1.0.jar，拷贝到 ExecuteDir/bin/jar 目录中；
* 继续执行 1 中的步骤；