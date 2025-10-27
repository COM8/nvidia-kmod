#!/bin/bash

NVIDIA_DRIVER_VERSION="580.119.02" # Taken from nvidia-kmod.spec
NVIDIA_DRIVER_EPOCH="1" # Taken from nvidia-kmod.spec
FEDORA_VERSION="42"

rm -rf "$NVIDIA_DRIVER_VERSION"_"$NVIDIA_DRIVER_EPOCH"
mkdir -p "$NVIDIA_DRIVER_VERSION"_"$NVIDIA_DRIVER_EPOCH"
cd "$NVIDIA_DRIVER_VERSION"_"$NVIDIA_DRIVER_EPOCH"

wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-cuda-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-cuda-libs-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-devel-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-kmodsrc-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-libs-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-power-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/x/xorg-x11-drv-nvidia-xorg-libs-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm

wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/n/nvidia-xconfig-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/n/nvidia-settings-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/n/nvidia-persistenced-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
wget https://download1.rpmfusion.org/nonfree/fedora/updates/$FEDORA_VERSION/x86_64/n/nvidia-modprobe-"$NVIDIA_DRIVER_VERSION"-"$NVIDIA_DRIVER_EPOCH".fc$FEDORA_VERSION.x86_64.rpm
