//
//  BTCentral.h
//  BlueTooth
//
//  Created by pedro  paulo on 3/27/14.
//  Copyleft 2014 pedro paulo. All rights reversed.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface BTCentral : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>

@property CBPeripheral *peripheral;
@property CBCentralManager *centralManager;
@property CBUUID *deviceNameServiceUUID;
@property CBUUID *deviceNameCharacteristicUUID;


@end
