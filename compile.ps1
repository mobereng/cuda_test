New-Item -ItemType Directory -Force -Path build/
Remove-Item build/* -Recurse -Confirm:$false -exclude .gitkeep
cmake -S . -B build/ -DCMAKE_GENERATOR_PLATFORM=x64 -DBOOST_ROOT="tools/boost/"
MSBuild.exe build/CudaTest.sln -property:Configuration=Release -m
