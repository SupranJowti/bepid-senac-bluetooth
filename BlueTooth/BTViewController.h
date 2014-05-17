//
//  BTViewController.h
//  BlueTooth
//
//  Created by pedro  paulo on 3/27/14.
//  Copyleft 2014 pedro paulo. All rights reversed.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "BTCentral.h"
#import "BTPeripheral.h"

@interface BTViewController : UIViewController 

@property BTCentral *central;
@property BTPeripheral *peripheral;

- (IBAction)becomeCentral:(id)sender;
- (IBAction)becomePeripheral:(id)sender;

@end
