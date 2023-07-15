#!/usr/bin/env bash

rm -rf $(pwd)/out
mkdir -p $(pwd)/out
make clean -j8 && make mrproper -j8 && make distclean -j8
export PATH="${HOME}/aarch64-linux-android-4.9/bin:${HOME}/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:${PATH}"

make O=out ARCH=arm64 vendor/a52q_eur_open_defconfig
read -p "Enter"
make O=out ARCH=arm64 \
CROSS_COMPILE=aarch64-linux-android- \
CLANG_TRIPLE=aarch64-linux-gnu- \
CC=clang \
DTC_EXT=$(pwd)/tools/dtc \
-j8
