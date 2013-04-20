//
//  smkViewController.h
//  CombinationLock
//
//  Created by smk-dev on 20.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smkSetPinViewController.h"
#import "smkLockViewController.h"

@interface smkMainViewController : UIViewController<smkSetPinViewControllerDelegate, smkLockViewControllerDelegate>

- (IBAction)setPinButtonAction:(id)sender;
- (IBAction)lockApplicationButtonAction:(id)sender;

@end
