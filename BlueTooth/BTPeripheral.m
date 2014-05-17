//
//  BTPeripheral.m
//  BlueTooth
//
//  Created by pedro  paulo on 3/27/14.
//  Copyleft 2014 pedro paulo. All rights reversed.
//

#import "BTPeripheral.h"

@implementation BTPeripheral

-(id)init{
    self = [super init];
    if(self){
        self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    }
    return self;
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral{
    if(peripheral.state == CBPeripheralManagerStatePoweredOn){
        [self setupTestPeripheral];
        NSLog(@"peripheral on");
    }
}

-(void)peripheralManager:(CBPeripheralManager *)peripheral didAddService:(CBService *)service error:(NSError *)error{
    if(error){
        NSLog(@"error adding service");
        return;
    }
    else{
        NSLog(@"advertising");
        [self.peripheralManager startAdvertising:@{CBAdvertisementDataServiceUUIDsKey : @[service.UUID]}];
    }
}

-(void) setupTestPeripheral{
  
    self.deviceNameCharacteristic = [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:@"2A00"] properties:CBCharacteristicPropertyRead value:[@"nomezinho" dataUsingEncoding:NSUTF8StringEncoding] permissions:CBAttributePermissionsReadable];
    
    self.deviceInformationService = [[CBMutableService alloc] initWithType:[CBUUID UUIDWithString:@"180A"] primary:YES];
    self.deviceInformationService.characteristics = @[self.deviceNameCharacteristic];
    [self.peripheralManager addService:self.deviceInformationService];
}


@end
