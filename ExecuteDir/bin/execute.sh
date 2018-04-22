#!/usr/bin/env bash
echo "current executable dir is $PWD"

cd ../Java2Smali/executableDir

cp ../../Hook/src/main/java/cn/wjdiankong/hookpms/*.java java/

./bin/java2smali.sh

cd ../../ExecuteDir

echo $PWD

java -Xmx2048m -XX:-UseParallelGC -XX:MinHeapFreeRatio=15 -jar bin/jar/KsToolsSrc-1.0.jar ++sign input/src

aapt_path=/Applications/Android/android-sdk-macosx/build-tools/27.0.3/aapt

root_path=.

java -Xmx2048m -XX:-UseParallelGC -XX:MinHeapFreeRatio=15 -jar bin/jar/KsToolsSrc-1.0.jar ++hook $root_path input/src.apk $aapt_path 1338303158


