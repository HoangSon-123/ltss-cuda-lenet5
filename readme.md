# mini-dnn-cpp
**mini-dnn-cpp** is a C++ demo of deep neural networks. It is implemented purely in C++, whose only dependency, Eigen, is header-only. 

## Usage

Linux
```shell
git clone https://github.com/ntp-shin/Cuda-Lenet5
cd Cuda-Lenet5
make setup
make run
```

Train LeNet5 with Colab (HOST):
```shell
!git clone https://github.com/ntp-shin/Cuda-Lenet5
!cd Cuda-Lenet5 && make clean && make clean_o
!cd Cuda-Lenet5 && make setup
!cd Cuda-Lenet5 && make run
```

Test LeNet5 with Colab (HOST):
```shell
!git clone https://github.com/ntp-shin/Cuda-Lenet5
!cd Cuda-Lenet5 && make clean && make clean_o
!cd Cuda-Lenet5 && make setup
!cd Cuda-Lenet5 && make test
```
Download: mode/*
