//
//  SettingViewController.h
//  iWake
//
//  Created by Fhict on 07/10/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmViewController.h"
#import "AFNetworking.h"

@interface SettingViewController : UIViewController

// Properties
// ==========
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *nameAlarm;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISwitch *switchOnOff;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIButton *radioBtn1;
@property (strong, nonatomic) IBOutlet UIButton *radioBtn2;
@property (strong, nonatomic) IBOutlet UIButton *radioBtn3;

// Methods
// =======
- (void)viewDidLayoutSubviews;
- (IBAction)backButton:(id)sender;
- (IBAction)setSwitch:(id)sender;
- (IBAction)saveSetting:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
-(void)radiobuttonSelected:(id)sender;

@end

