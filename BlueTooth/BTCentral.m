//
//  BTCentral.m
//  BlueTooth
//
//  Created by pedro  paulo on 3/27/14.
//  Copyleft 2014 pedro paulo. All rights reversed.
//

#import "BTCentral.h"

@implementation BTCentral

-(id)init{
    self = [super init];
    if(self){
        self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
        self.deviceNameServiceUUID = [CBUUID UUIDWithString:@"180A"];
        self.deviceNameCharacteristicUUID = [CBUUID UUIDWithString:@"2A00"];
    }
    return self;
}


-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    if(self.centralManager.state == CBCentralManagerStatePoweredOn){
        NSLog(@"central on");
        [self.centralManager scanForPeripheralsWithServices:@[self.deviceNameServiceUUID] options:nil];
    }
}


-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    
    NSLog(@"device name: %@", [[NSString alloc] initWithData: (NSData *)characteristic.value encoding:NSUTF8StringEncoding]);
}


-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    for(CBCharacteristic * c in service.characteristics){
        if([c.UUID.UUIDString isEqualToString: self.deviceNameCharacteristicUUID.UUIDString]){
            [self.peripheral readValueForCharacteristic:c];
        }
    }
}


-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    for(CBService *service in peripheral.services){
        if([service.UUID.UUIDString isEqualToString:self.deviceNameServiceUUID.UUIDString]){
            [peripheral discoverCharacteristics:nil forService:service];
        }
    }
}


-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    NSLog(@"peripheral connected");
    self.peripheral.delegate = self;
    [self.peripheral discoverServices:@[self.deviceNameServiceUUID]];    
}


-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
    NSLog(@"device discovered - trying to connect to peripheral");
    
    [self.centralManager stopScan];
    self.peripheral = peripheral;
    [self.centralManager connectPeripheral:self.peripheral options:nil];
    
}

-(void)peripheral:(CBPeripheral *)peripheral didModifyServices:(NSArray *)invalidatedServices{
    NSLog(@"invalidated service");
}

@end
