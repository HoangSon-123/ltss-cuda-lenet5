# mini-dnn-cpp
**mini-dnn-cpp** is a C++ demo of deep neural networks. It is implemented purely in C++, whose only dependency, Eigen, is header-only. 

## Usage

Linux
```shell
cd ltss-cuda-lenet5
make setup
make run
```

Train LeNet5 with Colab:
```shell
!cd ltss-cuda-lenet5&& make clean && make clean_o
!cd ltss-cuda-lenet5 && make setup
!cd ltss-cuda-lenet5 && make run
```

Test LeNet5 with Colab (CPU):
```shell
!cd ltss-cuda-lenet5 && make clean && make clean_o
!cd ltss-cuda-lenet5 && make setup
!cd ltss-cuda-lenet5 && make custom
!cd ltss-cuda-lenet5 && make test
```

Test LeNet5 with Colab (GPU):
```shell
!cd ltss-cuda-lenet5 && make clean && make clean_o
!cd ltss-cuda-lenet5 && make setup
!cd ltss-cuda-lenet5 && make custom
!cd ltss-cuda-lenet5 && make test_gpu1
```