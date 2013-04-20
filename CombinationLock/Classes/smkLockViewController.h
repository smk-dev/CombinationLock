//
//  smkLockViewController.h
//  CombinationLock
//
//  Created by smk-dev on 20.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol smkLockViewControllerDelegate <NSObject>

- (BOOL)isPinValid:(NSString *)pin;

@end

@interface smkLockViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) id<smkLockViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *pinPicker;

- (IBAction)unlockButtonAction:(id)sender;

@end
