BITS = 32
CONFIG_PY = config${BITS}.py

all: ./miracl
	echo "Done"

./miracl: ./core
	mkdir miracl \
	&& cd miracl \
	&& go mod init miracl \
	&& cp -r ../core/go/* . 

./core:
	git clone https://github.com/miracl/core/  \
	&& cd core/go \
	&& cat ../../select.txt | python3 ${CONFIG_PY}
 
clean:
	rm -rf ./go-tpm ./miracl ./core
