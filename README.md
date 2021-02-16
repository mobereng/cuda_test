# Cuda Test

## Project structure

As long as the dependencies are LIBIGL and BOOST, is recommended to have the following project structure:

```md
-> libigl/
-> boost/ (1.75.0)
-> base/
    -> build/ (Create this folder if not exist)
    -> cmake/
    -> src/
    -> ...
```

```powershell
mkdir cuda_test/ && cd cuda_test/
git clone https://github.com/libigl/libigl.git
git clone --branch boost-1.75.0 --single-branch --recursive https://github.com/boostorg/boost.git
git clone https://github.com/mobereng/cuda_test.git base
```

## Compile

Compile Boost and copy the generated `build` files to `base/tools` directory, so cmake compilation can find Boost.

```powershell
cd boost/libs/preprocessor/
git checkout develop
git pull
```
NOTE: This step is SUPER important as long as at this moment, the `preprocessor` has an issue with `nvcc` which has not being merged to the master branch

```powershell
cd boost/
.\bootstrap.bat
.\b2.exe install --prefix=build
Xcopy /E /I .\build\ ..\base\tools\boost\ /Y
```

Note: Make sure `base/tools/boost/` folder exist before copying the build folders there.

Compile this project using the standard cmake routine:

```powershell
.\compile.ps1
```
