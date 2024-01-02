##############################################################################
test_cpu.o: test_cpu.cc
	nvcc --compile test_cpu.cc -I./ -L/usr/local/cuda/lib64 -lcudart

test_cpu: test_cpu.o
	nvcc -o test_cpu -lm -lcuda -lrt test_cpu.o src/network.o src/mnist.o src/layer/*.o src/loss/*.o src/optimizer/*.o src/layer/custom/*.o -I./ -L/usr/local/cuda/lib64 -lcudart

test: test_cpu
	./test_cpu
##############################################################################


train_cpu: train_cpu.o 
	nvcc -o train_cpu -lm -lcuda -lrt train_cpu.o src/network.o src/mnist.o src/layer/*.o src/loss/*.o src/optimizer/*.o -I./ -L/usr/local/cuda/lib64 -lcudart

train_cpu.o: train_cpu.cc
	nvcc --compile train_cpu.cc -I./ -L/usr/local/cuda/lib64 -lcudart

############################################################################
test_gpu.o: test_gpu.cc
	nvcc --compile test_gpu.cc -I./ -L/usr/local/cuda/lib64 -lcudart

test_gpu: test_gpu.o
	nvcc -o test_gpu -lm -lcuda -lrt test_gpu.o src/network.o src/mnist.o src/layer/*.o src/loss/*.o src/optimizer/*.o src/layer/custom/*.o -I./ -L/usr/local/cuda/lib64 -lcudart

test_gpu1: test_gpu
		./test_gpu
############################################################################


main: main.o custom
	nvcc -o main -lm -lcuda -lrt main.o dnnNetwork.o src/network.o src/mnist.o src/layer/*.o src/loss/*.o src/optimizer/*.o -I./ -L/usr/local/cuda/lib64 -lcudart

main.o: main.cc
	nvcc --compile main.cc -I./ -L/usr/local/cuda/lib64 -lcudart

dnnNetwork.o: dnnNetwork.cc
	nvcc --compile dnnNetwork.cc -I./ -L/usr/local/cuda/lib64 -lcudart

network.o: src/network.cc
	nvcc --compile src/network.cc -o src/network.o -I./ -L/usr/local/cuda/lib64 -lcudart

mnist.o: src/mnist.cc
	nvcc --compile src/mnist.cc -o src/mnist.o  -I./ -L/usr/local/cuda/lib64 -lcudart

layer: src/layer/conv.cc src/layer/ave_pooling.cc src/layer/fully_connected.cc src/layer/max_pooling.cc src/layer/relu.cc src/layer/sigmoid.cc src/layer/softmax.cc src/layer/conv_gpu.cc
	nvcc --compile src/layer/ave_pooling.cc -o src/layer/ave_pooling.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/conv.cc -o src/layer/conv.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/fully_connected.cc -o src/layer/fully_connected.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/max_pooling.cc -o src/layer/max_pooling.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/relu.cc -o src/layer/relu.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/sigmoid.cc -o src/layer/sigmoid.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/softmax.cc -o src/layer/softmax.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/conv_gpu.cc -o src/layer/conv_gpu.o -I./ -L/usr/local/cuda/lib64 -lcudart

custom: src/layer/custom/gpu-utils.cu src/layer/custom/gpu-new-forward.cu src/layer/custom/gpu-new-forward-cus.cu
	nvcc --compile src/layer/custom/gpu-utils.cu -o src/layer/custom/gpu-utils.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/layer/custom/gpu-new-forward.cu -o src/layer/custom/gpu-new-forward.o -I./ -L/usr/local/cuda/lib64 -lcudart
#	nvcc --compile src/layer/custom/gpu-new-forward-cus.cu -o src/layer/custom/gpu-new-forward-cus.o -I./ -L/usr/local/cuda/lib64 -lcudart

loss: src/loss/cross_entropy_loss.cc src/loss/mse_loss.cc
	nvcc --compile src/loss/cross_entropy_loss.cc -o src/loss/cross_entropy_loss.o -I./ -L/usr/local/cuda/lib64 -lcudart
	nvcc --compile src/loss/mse_loss.cc -o src/loss/mse_loss.o -I./ -L/usr/local/cuda/lib64 -lcudart

optimizer: src/optimizer/sgd.cc
	nvcc --compile src/optimizer/sgd.cc -o src/optimizer/sgd.o -I./ -L/usr/local/cuda/lib64 -lcudart

clean:
	rm -f train_cpu test_cpu
	rm -f test_gpu1

clean_o:
	rm -f *.o src/*.o src/layer/*.o src/loss/*.o src/optimizer/*.o src/layer/custom/*.o

setup:
	make clean_o
	make clean
	make network.o
	make mnist.o
	make layer
	make loss
	make optimizer

run: train_cpu
	./train_cpu