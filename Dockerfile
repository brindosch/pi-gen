FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install	git vim parted /
			quilt realpath qemu-user-static debootstrap zerofree pxz zip dosfstools /
			bsdtar libcap2-bin rsync grep udev xz-utils curl
RUN rm -rf /var/lib/apt/lists/*

COPY . /pi-gen/

VOLUME [ "/pi-gen/work", "/pi-gen/deploy"]
