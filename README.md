# cordova-barcode-scanner-swift
## TL;DR

This Project make for practice intregrate cordova-ios with swift framework.

IOS framework using is [BarcodeScanner](https://github.com/hyperoslo/BarcodeScanner)

## Description BarcodeScanner

**BarcodeScanner** is a simple and beautiful wrapper around the camera with
barcode capturing functionality and a great user experience.

## How to make framework swift for cordova plugin
Use Carthage to checkout and build framework

Simple step to build framework

1. cd to fileSomeProject ios ``terminal: ~/Path/To/Starter/Project``
2. create file ``terminal: touch Cartfile``
3. edit Cartfile add ``github "hyperoslo/BarcodeScanner"``
4. run ``terminal: carthage update --platform iOS``
5. it will download and new folder.
6. Go to Carthage/Build copy .framework

