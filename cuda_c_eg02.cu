#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>

#define DATA_SIZE 1048576

int data[DATA_SIZE];

void generateNumbers(int *number, int size)
{
    for(int i = 0; i < size; i++){
        number[i] = rand() % 100;
    }
}

__global__ static void sumOfSquares(int *num, int *result)
{
    int sum = 0;
    int i;
    for(i = 0; i < DATA_SIZE; i++){
        sum += num[i] * num[i];
    }

    *result = sum;
}

int main(){
    generateNumbers(data, DATA_SIZE);
    
    int *gpudata;
    int *result;
    cudaMalloc((void**)&gpudata, size(int) * DATA_SIZE);
    cudaMalloc((void**)&result, size(int));

    cudaMemcpy(gpudata, data, sizeof(int)*DATA_SIZE, cudaMemcpyHostToDevice);
    sumOfSquare<<<1, 1, 0>>>(gpudata, result);

    int sum;
    cudaMemcpy(&sum, result, sizeof(int), cudaMemcpyDeviceToHost);
    cudaFree(gpudata);
    cudaFree(result);

    return 0;
}
