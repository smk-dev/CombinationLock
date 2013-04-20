//
//  smkViewController.m
//  CombinationLock
//
//  Created by smk-dev on 20.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkMainViewController.h"

@interface smkMainViewController()
@property (strong, nonatomic) NSString *pin;
@end

@implementation smkMainViewController

@synthesize pin = _pin;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    self.pin = @"1234";
}

- (void)dealloc {
    _pin = nil;
}

#pragma mark - Actions

- (IBAction)setPinButtonAction:(id)sender {
    // create view controller
    smkSetPinViewController *setPinVC = [self.storyboard instantiateViewControllerWithIdentifier:SET_PIN_VIEW_CONTROLLER_ID];
    setPinVC.delegate = self;
    
    // show
    [self presentViewController:setPinVC animated:YES completion:nil];
}

- (IBAction)lockApplicationButtonAction:(id)sender {
    // create
    smkLockViewController *lockViewController = [self.storyboard instantiateViewControllerWithIdentifier:LOCK_APPLICATION_VIEW_CONTROLLER_ID];
    lockViewController.delegate = self;
    
    // show
    [self presentViewController:lockViewController animated:YES completion:nil];
}

#pragma mark - smkSetPinViewControllerDelegate

- (void)setNewPin:(NSString *)pin {
    self.pin = pin;
}

#pragma mark - smkLockViewControllerDelegate

- (BOOL)isPinValid:(NSString *)pin {
    return [self.pin isEqualToString:pin];
}

@end
