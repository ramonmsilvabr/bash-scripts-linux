#!/bin/bash

case "$1" in 
    all)
        bootc upgrade
        fwupdmgr refresh && fwupdmgr get-updates && fwupdmgr update
        flatpak update
        echo $(rpm-ostree db diff -c)
        ;;
    flatpak)
        flatpak update
        ;;
    fwupd)
        fwupdmgr refresh && fwupdmgr get-updates && fwupdmgr update
        ;;
    bootc)
        bootc upgrade
        echo $(rpm-ostree db diff -c)
        ;;
    system)
        bootc upgrade
        echo $(rpm-ostree db diff -c)
        fwupdmgr refresh && fwupdmgr get-updates && fwupdmgr update
        ;;
    *)
        echo "Argumento *all* *flatpak* *fwupd* *bootc* ou *system* necessário"
        ;;
esac

read -p "Pressione Enter para fechar essa janela..."
