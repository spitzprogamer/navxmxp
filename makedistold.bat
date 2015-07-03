REM Batch file to create the navX MXP distributable package
md dist
pushd dist

mkdir stm32
mkdir stm32\bin
mkdir crio
mkdir crio\java
mkdir crio\java\bin
mkdir crio\java\doc
mkdir crio\c++
mkdir crio\labview
mkdir roborio
mkdir roborio\java
mkdir roborio\java\bin
mkdir roborio\java\doc
mkdir roborio\c++
mkdir roborio\labview
mkdir docs
mkdir enclosure
mkdir processing
mkdir schematics
mkdir drivers
mkdir navXConfig
mkdir navXMagCalibrator

REM TODO:  Need to fix the folder locations for the navx MXP project

cp ../crio/java/nav6/build/nav6.jar ./crio/java/bin/
cp -r ../crio/java/nav6 ./crio/java/
rm -r -f ./crio/java/nav6/build
rm -r -f ./crio/java/nav6/nbproject/private
rm -r -f ./crio/java/nav6/doc
cp -r ../crio/java/nav6/doc/* ./crio/java/doc/
cp -r ../crio/java/nav6SimpleRobotExample ./crio/java/
rm -r -f ./crio/java/nav6SimpleRobotExample/nbproject/private
rm -r -f ./crio/java/nav6SimpleRobotExample/build
cp -r ../roborio/java/navXMXPSimpleRobotExample ./roborio/java/
rm -r -f ./crio/java/nav6SimpleRobotExample/bin
rm -r -f ./crio/java/nav6SimpleRobotExample/build
rm -r -f ./crio/java/nav6SimpleRobotExample/dist
cp -r ../crio/c++/* ./crio/c++/
rm -r -f ./crio/c++/nav6SimpleRobotExample/PPC603gnu
cp -r ../roborio/c++/* ./roborio/c++/
cp -r ../crio/labview/* ./crio/labview/
cp -r ../roborio/labview/* ./roborio/labview
cp -r ../docs/* ./docs/
rm -r -f ./docs/errata
cp -r ../enclosure/* ./enclosure
cp -r ../schematics/* ./schematics
cp -r ../processing/* ./processing
rm -r -f ./processing/nav6UI/application*
cp ../*.txt ./
rm ../navx-mxp.zip
xcopy /S /E /Y ..\stm32 .\stm32
rm -r -f ./drivers/*
cp -r ../drivers/* ./drivers
rm -r -f ./navXConfig/*
cp -r ../c#/navXConfig/bin/Debug/app.publish/* ./navXConfig 
rm -r -f ./navXMagCalibrator/*
cp -r ../c#/navXMagCalibrator/bin/Debug/app.publish/* ./navXMagCalibrator 
REM Delete any stm32 files copied to the dist directory which are not appropriate for distribution
del /S /Q .\stm32\Debug\*.*
del /S /Q .\stm32\Release\*.*
del /S /Q .\stm32\MPU9250\core\*.*
del /S /Q .\stm32\MPU9250\mpl\*.*
del /S /Q .\roborio\c++\navXMXP_CPlusPlus_RobotExample\Debug\*.*
del /S /Q .\roborio\java\navXMXPSimpleRobotExample\build\*.*
rm  -r -f .\.svn
"C:\Program Files\7-Zip\7z" a ../navx-mxp.zip *
popd
rm -r -f dist
REM dosyncftp