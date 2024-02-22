#!/bin/sh

# install build depends
# apk add gcc g++ python cmake samurai gmp-dev mpfr-dev

# get pytorch
# git clone --recursive https://github.com/pytorch/pytorch

# create and activate virtual env
# python -m venv pytorch-venv
# . pytorch-venv/bin/activate

# install pytorch depends
# cd pytorch
# pip install -r requirements.txt

# building cpp files here frequently takes 1G+ of ram, so for a low-ram
# device like phone it's 1 job max
export MAX_JOBS=1

# cuda and rocm are for big computers, disable
export USE_CUDA=0 USE_ROCM=0 USE_CUDNN=0 USE_CUSPARSELT=0

# profiling not needed
export USE_KINETO=0

# build release
export BUILD_TEST=0

# this is for inference on x86 servers
export USE_FBGEMM=0

# mkl is for intel's hardware
export USE_MKLDNN=0

# intel's instrumentation and tracing tech
export USE_ITT=0

# no distributed training on phones
export USE_DISTRIBUTED=0 USE_TENSORPIPE=0 USE_GLOO=0 USE_MPI=0 USE_SYSTEM_NCCL=0

# we just need torch
export BUILD_CAFFE2_OPS=0 BUILD_CAFFE2=0

# opencl support needs testing
export USE_OPENCL=1

exec python setup.py build

# install as editable into current venv
# pip install -e .
