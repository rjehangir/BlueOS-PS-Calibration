# BlueOS Power Switch Calibration Extension

This extension provides a simple routine to calibrate the offset of the "Power Switch" used in the BlueBoat to provide a more accurate current and power measurement.

## Build
Execute the following command to build your extension:

   ```shell
   docker buildx build --platform linux/arm/v7 . -t my_docker_user/blueos-ps-calibration:latest --output type=registry
    ```
