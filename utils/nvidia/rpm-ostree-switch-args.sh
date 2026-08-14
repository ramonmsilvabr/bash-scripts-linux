#!/bin/bash

case "$1" in 
    nvidia)
        pkexec rpm-ostree kargs --delete=nouveau.runpm --delete=nouveau.atomic --append=nvidia.NVreg_EnableS0ixPowerManagement=1 --append=nvidia.NVreg_TemporaryFilePath=/var/tmp --append=nvidia.NVreg_EnableResizableBar=1
        ;;
    nouveau)
        pkexec rpm-ostree kargs --append=nouveau.runpm=0 --append=nouveau.atomic=1 --delete=nvidia.NVreg_EnableS0ixPowerManagement --delete=nvidia.NVreg_TemporaryFilePath --delete=nvidia.NVreg_EnableResizableBar --delete=rd.driver.blacklist --delete=modprobe.blacklist
        ;;
    *)
        echo "Argumento: (nvidia) ou (nouveau) necessário."
        exit
        ;;    
esac
