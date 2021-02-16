# Cuda Test

## Project structure

As long as the dependencies are LIBIGL and BOOST, is recommended to have the following project structure:

```md
-> libigl/
-> base/
    -> build/ (Create this folder if not exist)
    -> cmake/
    -> src/
    -> ...
```

```powershell
mkdir cuda_test/ && cd cuda_test/
git clone https://github.com/libigl/libigl.git
git clone https://github.com/mobereng/cuda_test.git base
```

## Compile

Compile this project using the standard cmake routine:

```powershell
.\compile.ps1
```
