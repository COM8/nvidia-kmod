# `rpm-ostree compose` Compatible nvidia-kmod

This repo is a fork of [rpmfusion/nvidia-kmod](https://github.com/rpmfusion/nvidia-kmod) and adds support for including the akmod kernel module during ostree-compose.

It solves the issue where you can not include `akmod-nvidia` during `rpm-ostree compose` (more: https://github.com/coreos/rpm-ostree/issues/4983). Doing it will fail with the following error:

```
akmod-nvidia.post: Building /usr/src/akmods/nvidia-kmod-550.78-1.fc40.src.rpm for kernel 6.8.11-300.fc40.x86_64
akmod-nvidia.post: Installing /usr/src/akmods/nvidia-kmod-550.78-1.fc40.src.rpm
akmod-nvidia.post: Building target platforms: x86_64
akmod-nvidia.post: Building for target x86_64
akmod-nvidia.post: setting SOURCE_DATE_EPOCH=1714089600
akmod-nvidia.post: warning: Could not canonicalize hostname: f4ba1ea9c96d
akmod-nvidia.post: error: Failed build dependencies:
akmod-nvidia.post: 	/usr/bin/kmodtool is needed by nvidia-kmod-3:550.78-1.fc40.x86_64
akmod-nvidia.post: 	gcc is needed by nvidia-kmod-3:550.78-1.fc40.x86_64
akmod-nvidia.post: 	kernel-devel-uname-r = 6.8.11-300.fc40.x86_64 is needed by nvidia-kmod-3:550.78-1.fc40.x86_64
akmod-nvidia.post: 	xorg-x11-drv-nvidia-kmodsrc = 3:550.78 is needed by nvidia-kmod-3:550.78-1.fc40.x86_64
akmod-nvidia.post: 
akmod-nvidia.post: RPM build warnings:
akmod-nvidia.post:     Could not canonicalize hostname: f4ba1ea9c96d
```

To solve this I did the following changes to the package:

* Migrate all `BuildRequires` from `kmod-nvidia` to `Requires` inside `akmod-nvidia`.
* Include the nvidia kmod sources (e.g. `nvidia-kmod-550.90.07-x86_64.tar.xz`) inside this package to prevent a race condition where it might get installed after `akmod-nvidia` `%post`. Originally nvidia kmod sources are a part of `xorg-x11-drv-nvidia-kmodsrc`.

## How To Use

```bash
# Install all build dependencies
sudo dnf install rpm-build rpmdevtools

# Clone the repository
git clone https://github.com/COM8/nvidia-kmod.git
cd nvidia-kmod

# Build the RPM
rm -rf ~/rpmbuild/ && rpmdev-setuptree && cp *.spec ~/rpmbuild/SPECS/ && cp -r * ~/rpmbuild/SOURCES/ && rpmbuild -bb ~/rpmbuild/SPECS/nvidia-kmod.spec

# Now you find the build RPMs inside this directory
ls -l ~/rpmbuild/RPMS/x86_64/

# You can host the RPMs inside your own RPM repository. Ref: https://earthly.dev/blog/creating-and-hosting-your-own-rpm-packages-and-yum-repo/
```

⚠️ Don't forget to add the correct kernel arguments on your system to disable the nouveau driver: https://rpmfusion.org/Howto/NVIDIA
