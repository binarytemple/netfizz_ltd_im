---
layout: post
title:  "OWC Aura Pro X aftermarket SSD on Macbook"
date:   2019-07-09 08:19:12
categories: jekyll update
---

I got an OWC Aura Pro X in order to upgrade my Macbook drive from it's somewhat measly 256GB drive to 1TB as I needed to build a lot of Docker images.

On the initial install, the system was running for 12 hours trying to install OSX and was so sluggish I could barely move the mouse pointer accross the screen.

I rebooted the machine, suddenly the system started behaving normally. I mean, the whole process started from the beginning again but this time it completed in about 20 minutes. 

"Hmmm", I thought, "that doesn't bode well".

Mostly the OWC device functions normally, but sometimes it just seems to get overwhelmed, particularly if I don't reboot the system every day or two.

The crash reports after the system restarts always look like this (note the reference to 'IONVMeController.cpp' :

```
    Fri Aug  9 16:44:09 2019

    *** Panic Report ***
    panic(cpu 4 caller 0xffffff7f8e892b30): nvme: "Fatal error occurred. CSTS=0xffffffff US[1]=0x0 US[0]=0x5 VID/DID=0x2260126f
    . FW Revision=C2.3.21\n"@/BuildRoot/Library/Caches/com.apple.xbs/Sources/IONVMeFamily/IONVMeFamily-387.270.1/IONVMeController.cpp:5334
    Backtrace (CPU 4), Frame : Return Address
    0xffffff922049bae0 : 0xffffff800b5ad6ed 
    0xffffff922049bb30 : 0xffffff800b6e9185 
    0xffffff922049bb70 : 0xffffff800b6da8ba 
    0xffffff922049bbe0 : 0xffffff800b55ab40 
    0xffffff922049bc00 : 0xffffff800b5ad107 
    0xffffff922049bd20 : 0xffffff800b5acf53 
    0xffffff922049bd90 : 0xffffff7f8e892b30 
    0xffffff922049bef0 : 0xffffff7f8e892db7 
    0xffffff922049bf30 : 0xffffff800bcbbe7e 
    0xffffff922049bf70 : 0xffffff800bcbbbf8 
    0xffffff922049bfa0 : 0xffffff800b55a0ce 
          Kernel Extensions in backtrace:
             com.apple.iokit.IONVMeFamily(2.1)[A67B3600-6FE3-3037-AC41-8C2D353B6250]@0xffffff7f8e885000->0xffffff7f8e8c4fff
                dependency: com.apple.driver.AppleMobileFileIntegrity(1.0.5)[888F591F-8A21-30F9-812F-D366292AA679]@0xffffff7f8c514000
                dependency: com.apple.iokit.IOPCIFamily(2.9)[202F4F5C-5E3C-35A9-A7AD-F85B0E3CD199]@0xffffff7f8be95000
                dependency: com.apple.driver.AppleEFINVRAM(2.1)[B83F29B8-24AC-303B-BBBA-CF332168FDE6]@0xffffff7f8c6ea000
                dependency: com.apple.iokit.IOStorageFamily(2.1)[71BB22B0-3075-35A1-B04E-FBAC574DA80D]@0xffffff7f8c30a000
                dependency: com.apple.iokit.IOReportFamily(47)[0BC9F93B-456A-3D97-BE4C-69DCBB5E8A3C]@0xffffff7f8c839000

    BSD process name corresponding to current thread: kernel_task

    Mac OS version:
    18G87

    Kernel version:
    Darwin Kernel Version 18.7.0: Thu Jun 20 18:42:21 PDT 2019; root:xnu-4903.270.47~4/RELEASE_X86_64
    Kernel UUID: 982F17B3-0252-37FB-9869-88B3B1C77335
    Kernel slide:     0x000000000b200000
    Kernel text base: 0xffffff800b400000
    __HIB  text base: 0xffffff800b300000
    System model name: MacBookPro11,4 (Mac-06F11FD93F0323C5)

    System uptime in nanoseconds: 24684961336541
    last loaded kext at 16782820829592: com.apple.driver.AppleXsanScheme  3 (addr 0xffffff7f8ee3b000, size 32768)
    last unloaded kext at 16983281709817: com.apple.driver.AppleXsanScheme  3 (addr 0xffffff7f8ee3b000, size 32768)
    loaded kexts:
    com.google.drivefs.filesystems.dfsfuse  32.0.11
    org.virtualbox.kext.VBoxNetAdp  5.2.22
    org.virtualbox.kext.VBoxNetFlt  5.2.22
    org.virtualbox.kext.VBoxUSB 5.2.22
    org.virtualbox.kext.VBoxDrv 5.2.22
    at.obdev.nke.LittleSnitch 5422
    com.apple.driver.AudioAUUC  1.70
    com.apple.fileutil  20.036.15
    com.apple.filesystems.autofs  3.0
    com.apple.driver.AppleUpstreamUserClient  3.6.5
    com.apple.driver.AppleHDA 282.54
    com.apple.driver.ApplePlatformEnabler 2.7.0d0
    com.apple.driver.AGPM 110.25.11
    com.apple.driver.X86PlatformShim  1.0.0
    com.apple.driver.AppleGraphicsDevicePolicy  3.50.12
    com.apple.AGDCPluginDisplayMetrics  3.50.12
    com.apple.driver.AppleHV  1
    com.apple.iokit.IOUserEthernet  1.0.1
    com.apple.iokit.IOBluetoothSerialManager  6.0.14d3
    com.apple.driver.pmtelemetry  1
    com.apple.Dont_Steal_Mac_OS_X 7.0.0
    com.apple.driver.AppleBacklight 170.12.12
    com.apple.driver.AppleIntelHD5000Graphics 12.1.0
    com.apple.driver.eficheck 1
    com.apple.driver.AppleMCCSControl 1.5.9
    com.apple.driver.AppleIntelSlowAdaptiveClocking 4.0.0
    com.apple.iokit.BroadcomBluetooth20703USBTransport  6.0.14d3
    com.apple.driver.AppleLPC 3.1
    com.apple.driver.AppleOSXWatchdog 1
    com.apple.driver.AppleCameraInterface 6.8.0
    com.apple.driver.AppleIntelFramebufferAzul  12.1.0
    com.apple.driver.AppleSMCLMU  212
    com.apple.driver.AppleThunderboltIP 3.1.2
    com.apple.driver.AppleTopCaseHIDEventDriver 138.4
    com.apple.driver.AppleUSBTopCaseDriver  138.4
    com.apple.driver.AppleUSBCardReader 456.260.3
    com.apple.filesystems.apfs  945.275.7
    com.apple.driver.AirPort.BrcmNIC  1400.1.1
    com.apple.driver.AppleVirtIO  2.1.3
    com.apple.filesystems.hfs.kext  407.200.4
    com.apple.AppleFSCompression.AppleFSCompressionTypeDataless 1.0.0d1
    com.apple.BootCache 40
    com.apple.AppleFSCompression.AppleFSCompressionTypeZlib 1.0.0
    com.apple.AppleSystemPolicy 1.0
    com.apple.private.KextAudit 1.0
    com.apple.driver.AppleSmartBatteryManager 161.0.0
    com.apple.driver.AppleHPET  1.8
    com.apple.driver.AppleACPIButtons 6.1
    com.apple.driver.AppleRTC 2.0
    com.apple.driver.AppleSMBIOS  2.1
    com.apple.driver.AppleACPIEC  6.1
    com.apple.driver.AppleAPIC  1.7
    com.apple.nke.applicationfirewall 201
    com.apple.security.TMSafetyNet  8
    com.apple.iokit.IOUSBUserClient 900.4.2
    com.apple.kext.triggers 1.0
    com.apple.driver.DspFuncLib 282.54
    com.apple.kext.OSvKernDSPLib  528
    com.apple.iokit.IOAVBFamily 760.6
    com.apple.plugin.IOgPTPPlugin 740.2
    com.apple.iokit.IOEthernetAVBController 1.1.0
    com.apple.iokit.IOSkywalkFamily 1
    com.apple.driver.AppleSSE 1.0
    com.apple.driver.AppleBacklightExpert 1.1.0
    com.apple.AppleGPUWrangler  3.50.12
    com.apple.iokit.IONDRVSupport 530.51
    com.apple.driver.X86PlatformPlugin  1.0.0
    com.apple.driver.AppleSMBusController 1.0.18d1
    com.apple.iokit.IOSlowAdaptiveClockingFamily  1.0.0
    com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport 6.0.14d3
    com.apple.iokit.IOBluetoothHostControllerUSBTransport 6.0.14d3
    com.apple.iokit.IOBluetoothHostControllerTransport  6.0.14d3
    com.apple.driver.AppleGraphicsControl 3.50.12
    com.apple.driver.IOPlatformPluginFamily 6.0.0d8
    com.apple.AppleGraphicsDeviceControl  3.50.12
    com.apple.iokit.IOAcceleratorFamily2  404.14
    com.apple.iokit.IOSurface 255.6.1
    com.apple.driver.AppleHDAController 282.54
    com.apple.iokit.IOGraphicsFamily  530.66
    com.apple.iokit.IOHDAFamily 282.54
    com.apple.driver.AppleActuatorDriver  2450.1
    com.apple.driver.AppleHSBluetoothDriver 138.4
    com.apple.driver.IOBluetoothHIDDriver 6.0.14d3
    com.apple.iokit.IOBluetoothFamily 6.0.14d3
    com.apple.driver.AppleHIDKeyboard 208
    com.apple.driver.AppleMultitouchDriver  2450.1
    com.apple.driver.AppleInputDeviceSupport  2440.2
    com.apple.driver.usb.IOUSBHostHIDDevice 1.2
    com.apple.iokit.IOAudioFamily 206.5
    com.apple.vecLib.kext 1.2.0
    com.apple.driver.usb.networking 5.0.0
    com.apple.driver.usb.AppleUSBHostCompositeDevice  1.2
    com.apple.driver.AppleThunderboltDPInAdapter  5.6.9
    com.apple.driver.AppleThunderboltDPAdapterFamily  5.6.9
    com.apple.driver.AppleThunderboltPCIDownAdapter 2.1.5
    com.apple.driver.AppleThunderboltNHI  4.7.9
    com.apple.iokit.IOThunderboltFamily 6.8.6
    com.apple.iokit.IO80211Family 1200.12.2
    com.apple.driver.mDNSOffloadUserClient  1.0.1b8
    com.apple.driver.corecapture  1.0.4
    com.apple.iokit.IONVMeFamily  2.1.0
    com.apple.driver.usb.AppleUSBXHCIPCI  1.2
    com.apple.driver.usb.AppleUSBXHCI 1.2
    com.apple.iokit.IOSerialFamily  11
    com.apple.filesystems.hfs.encodings.kext  1
    com.apple.driver.usb.AppleUSBHostPacketFilter 1.0
    com.apple.iokit.IOUSBFamily 900.4.2
    com.apple.driver.AppleUSBHostMergeProperties  1.2
    com.apple.driver.AppleEFINVRAM  2.1
    com.apple.driver.AppleEFIRuntime  2.1
    com.apple.iokit.IOSMBusFamily 1.1
    com.apple.iokit.IOHIDFamily 2.0.0
    com.apple.security.quarantine 3
    com.apple.security.sandbox  300.0
    com.apple.kext.AppleMatch 1.0.0d1
    com.apple.driver.DiskImages 493.0.0
    com.apple.driver.AppleFDEKeyStore 28.30
    com.apple.driver.AppleEffaceableStorage 1.0
    com.apple.driver.AppleKeyStore  2
    com.apple.driver.AppleUSBTDM  456.260.3
    com.apple.driver.AppleMobileFileIntegrity 1.0.5
    com.apple.iokit.IOUSBMassStorageDriver  145.200.2
    com.apple.iokit.IOSCSIBlockCommandsDevice 408.250.3
    com.apple.iokit.IOSCSIArchitectureModelFamily 408.250.3
    com.apple.iokit.IOStorageFamily 2.1
    com.apple.kext.CoreTrust  1
    com.apple.driver.AppleCredentialManager 1.0
    com.apple.driver.KernelRelayHost  1
    com.apple.iokit.IOUSBHostFamily 1.2
    com.apple.driver.usb.AppleUSBCommon 1.0
    com.apple.driver.AppleBusPowerController  1.0
    com.apple.driver.AppleSEPManager  1.0.1
    com.apple.driver.IOSlaveProcessor 1
    com.apple.iokit.IOReportFamily  47
    com.apple.iokit.IOTimeSyncFamily  740.2
    com.apple.iokit.IONetworkingFamily  3.4
    com.apple.driver.AppleACPIPlatform  6.1
    com.apple.driver.AppleSMC 3.1.9
    com.apple.iokit.IOPCIFamily 2.9
    com.apple.iokit.IOACPIFamily  1.4
    com.apple.kec.pthread 1
    com.apple.kec.Libm  1
    com.apple.kec.corecrypto  1.0

    EOF
    Model: MacBookPro11,4, BootROM MBP114.0182.B00, 4 processors, Intel Core i7, 2.2 GHz, 16 GB, SMC 2.29f24
    Graphics: kHW_IntelIrisProItem, Intel Iris Pro, spdisplays_builtin
    Memory Module: BANK 0/DIMM0, 8 GB, DDR3, 1600 MHz, 0x802C, 0x31364B544631473634485A2D314736453120
    Memory Module: BANK 1/DIMM0, 8 GB, DDR3, 1600 MHz, 0x802C, 0x31364B544631473634485A2D314736453120
    AirPort: spairport_wireless_card_type_airport_extreme (0x14E4, 0x152), Broadcom BCM43xx 1.0 (7.77.61.2 AirPortDriverBrcmNIC-1305.8)
    Bluetooth: Version 6.0.14d3, 3 services, 18 devices, 1 incoming serial ports
    Network Service: Wi-Fi, AirPort, en0
    USB Device: USB 3.0 Bus
    USB Device: Internal Memory Card Reader
    USB Device: Apple Internal Keyboard / Trackpad
    USB Device: Bluetooth USB Host Controller
    Thunderbolt Bus: MacBook Pro, Apple Inc., 27.1

```

I wonder if anyone else has experienced similar issues? I'm guessing that Apple don't exactly encourage aftermarket products on the Mackbook (accessories, cables and upgrades being one of their major revenue streams). If you've had any similar issues, hit me up on twitter and share your experience. 

