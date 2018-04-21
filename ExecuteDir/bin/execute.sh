echo "current executable dir is $PWD"

cd ../Java2Smali/executableDir

cp ../../Hook/src/main/java/cn/wjdiankong/hookpms/*.java java/

./bin/java2smali.sh

cd ../../ExecuteDir

echo $PWD




