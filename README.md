
Example build drivers for 4.7.53
You may need a pullsecret for the openshift image, get his from console.redhat.com -> openshift -> create cluster -> local -> Download Pull secret 
Save as pull.txt for the below example.

The build.sh file shows how to derive --from for an OCP version.


Step 1. Get driver src code. 

```
https://dl.dell.com/FOLDER08043971M/1/QLogic_Linux_Source_35.35.00.06.tar.gz 
tar -xf ./QLogic_Linux_Source_35.35.00.06.tar.gz E4_Driver_Source/fastlinq-8.59.6.0.tar.bz2
bunzip2 E4_Driver_Source/fastlinq-8.59.6.0.tar.bz2; mv E4_Driver_Source/fastlinq-8.59.6.0.tar.bz2 .
```

Step 2. Compile driver image.
```
podman build --authfile=./pull.txt --from=quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:7913bdf72cc83f3ef8b09850770170e54a28feb8d2d54caf29883b20cea4b1ab -t qlogic:4.7.53 .
```

Step 3. 

At this point the image committed contains compiled ko files and firmware blobs in the src tree, we just need to copy the image to a host and install the firmware the /lib/ folder and insmod the ko files.
We can just make a systemd unit file todo this one boot.
We may need to rmmod the old drivers first, however we can blacklist them all using the kernel args (can use kernelArguments in mc) https://access.redhat.com/solutions/41278


#We can leverage kvc scripts here. might need to tweak the start deps.
TODO: install script. Need to copy firmware to correct path on host, and also insmod ko files.

