New-Item -ItemType Directory -Force -Path build/
Remove-Item build/* -Recurse -Confirm:$false -exclude .gitkeep
#cmake -S . -B build/ -DCMAKE_GENERATOR_PLATFORM=x64 -DBOOST_ROOT=tools/boost/ -DThrust_DIR="../thrust/thrust/cmake/" -DEigen3_DIR="../eigen/share/eigen3/cmake/"
cmake -S . -B build/ -DCMAKE_GENERATOR_PLATFORM=x64 -DBOOST_ROOT=tools/boost/ -DEigen3_DIR="../eigen/share/eigen3/cmake/"
MSBuild.exe build/CudaTest.sln -property:Configuration=Release -m
