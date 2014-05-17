//
//  BTPeripheral.h
//  BlueTooth
//
//  Created by pedro  paulo on 3/27/14.
//  Copyleft 2014 pedro paulo. All rights reversed.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface BTPeripheral : NSObject <CBPeripheralManagerDelegate>

@property CBPeripheralManager *peripheralManager;
@property CBMutableCharacteristic *deviceNameCharacteristic;
@property CBMutableService *deviceInformationService;


@end
