//
//  smkSetPinViewController.m
//  CombinationLock
//
//  Created by smk-dev on 20.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkSetPinViewController.h"

#define MAX_PIN_LENGTH 4

@interface smkSetPinViewController()
- (void)dismissView;
@end

@implementation smkSetPinViewController

@synthesize delegate = _delegate;

#pragma mark - Lifecycle

- (void)dealloc {
    _delegate = nil;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // no paste is enabled
    if (range.length > 1) {
        return NO;
    }
    
    // max length
    if ([textField.text length] == MAX_PIN_LENGTH && [string length] > 0) {
        return NO;
    }
    
    // digits only
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:string];
    if (![alphaNums isSupersetOfSet:inStringSet]) {
        return NO;
    }
    
    return YES;
}

#pragma mark - Actions

- (IBAction)cancelButtonAction:(id)sender {
    // close
    [self dismissView];
}

- (IBAction)saveButtonAction:(id)sender {
    
    // check equality
    if (![self.pinTextField1.text isEqualToString:self.pinTextField2.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"PINS are not equal" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // pin length
    if ([self.pinTextField1.text length] != MAX_PIN_LENGTH) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"PIN must have 4 digits" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // delegate
    if (self.delegate) {
        [self.delegate setNewPin:self.pinTextField1.text];
    }
    
    // close
    [self dismissView];
}

#pragma mark - Private methods

- (void)dismissView {
    // delay
    double delayInSeconds = 0.0;
    
    // resign responder
    if ([self.pinTextField1 isFirstResponder]) {
        [self.pinTextField1 resignFirstResponder];
        delayInSeconds = 0.3;
    }
    if ([self.pinTextField2 isFirstResponder]) {
        [self.pinTextField2 resignFirstResponder];
        delayInSeconds = 0.3;
    }
    
    // close with delay
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

@end
