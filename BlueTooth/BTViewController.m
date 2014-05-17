//
//  BTViewController.m
//  BlueTooth
//
//  Created by pedro  paulo on 3/27/14.
//  Copyleft 2014 pedro paulo. All rights reversed.
//

#import "BTViewController.h"

@implementation BTViewController

- (IBAction)becomeCentral:(id)sender {
    self.central = [[BTCentral alloc] init];

}
- (IBAction)becomePeripheral:(id)sender {
    self.peripheral = [[BTPeripheral alloc] init];
}
@end
