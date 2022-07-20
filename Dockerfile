FROM scratch

# get this file from 
# https://dl.dell.com/FOLDER08043971M/1/QLogic_Linux_Source_35.35.00.06.tar.gz 
# tar -xf ./QLogic_Linux_Source_35.35.00.06.tar.gz E4_Driver_Source/fastlinq-8.59.6.0.tar.bz2
# bunzip2 E4_Driver_Source/fastlinq-8.59.6.0.tar.bz2; mv E4_Driver_Source/fastlinq-8.59.6.0.tar.bz2 .
# this container doesnt have bzip2
ADD fastlinq-8.59.6.0.tar /src/qlogic

#RUN rpm -q
RUN cd /src/qlogic/* &&  make KVER=4.18.0-305.49.1.el8_4.x86_64 LINUXSRC=/usr/src/kernels/4.18.0-305.49.1.el8_4.x86_64/ KERNEL_DIR=/usr/src/kernels/4.18.0-305.49.1.el8_4.x86_64 -j$(nproc)
