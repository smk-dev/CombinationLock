//
//  smkLockViewController.m
//  CombinationLock
//
//  Created by smk-dev on 20.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkLockViewController.h"

#define PIN_LENGTH 4
#define PICKER_LENGTH 1000

@implementation smkLockViewController

@synthesize delegate = _delegate;

#pragma mark - Lifecycle

- (void)dealloc {
    _delegate = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.pinPicker selectRow:(PICKER_LENGTH / 2) inComponent:0 animated:NO];
    [self.pinPicker selectRow:(PICKER_LENGTH / 2) inComponent:1 animated:NO];
    [self.pinPicker selectRow:(PICKER_LENGTH / 2) inComponent:2 animated:NO];
    [self.pinPicker selectRow:(PICKER_LENGTH / 2) inComponent:3 animated:NO];
}

#pragma mark - Actions

- (IBAction)unlockButtonAction:(id)sender {
    
    // verify
    if (self.delegate) {
        if ([self.delegate isPinValid:[self pickedPin]]) {
            // close
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

#pragma mark - Private methods

- (NSString *)pickedPin {
    NSMutableString *pin = [[NSMutableString alloc] init];
    [pin appendFormat:@"%d", ([self.pinPicker selectedRowInComponent:0] % 10)];
    [pin appendFormat:@"%d", ([self.pinPicker selectedRowInComponent:1] % 10)];
    [pin appendFormat:@"%d", ([self.pinPicker selectedRowInComponent:2] % 10)];
    [pin appendFormat:@"%d", ([self.pinPicker selectedRowInComponent:3] % 10)];
    
    return pin;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return PIN_LENGTH;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return PICKER_LENGTH;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"    %d", (row % 10)];
}

@end
