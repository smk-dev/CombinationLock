//
//  smkSetPinViewController.h
//  CombinationLock
//
//  Created by smk-dev on 20.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol smkSetPinViewControllerDelegate <NSObject>

- (void)setNewPin:(NSString *)pin;

@end

@interface smkSetPinViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *pinTextField1;
@property (weak, nonatomic) IBOutlet UITextField *pinTextField2;
@property (strong, nonatomic) id<smkSetPinViewControllerDelegate> delegate;

- (IBAction)cancelButtonAction:(id)sender;
- (IBAction)saveButtonAction:(id)sender;

@end
