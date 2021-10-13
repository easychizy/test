# oneVPL Docker

# Requirements: 11th generation Intel Core CPU, Ubuntu 20.04.

# Execution:
* Start Docker
```
docker build -t onevpl1 .
docker run --privileged -it onevpl1
```
* Set environments
```
source /opt/intel/oneapi/setvars.sh
```
* Run samples
```
cd bin
./decvpp_tool h265 -i ../examples/content/cars_128x96.h265 -o dec.raw -vpp_num 2 -vpp_params 320x240_i420,640x480_bgra -vpp_out o1.raw,o2.raw
./decvpp_tool h265 -sw -i ../examples/content/cars_128x96.h265 -o dec.raw -vpp_num 2 -vpp_params 320x240_i420,640x480_bgra -vpp_out o1.raw,o2.raw
./sample_multi_transcode -i::h265 ../examples/content/cars_128x96.h265 -o::h264 o.h264
./sample_decode h265 -i ../examples/content/cars_128x96.h265 -hw
./sample_decode h265 -i ../examples/content/cars_128x96.h265 -sw
./sample_decode h265 -i ../examples/content/cars_128x96.h265
```
* Build and run from source
```
cd oneAPI-samples/Libraries/oneVPL/hello-decode/
mkdir build
cd build
cmake
cmake --build .
./hello-decode -i ../../../../../examples/content/cars_128x96.h265
```