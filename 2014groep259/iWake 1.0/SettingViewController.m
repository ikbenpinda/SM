//
//  SettingViewController.m
//  iWake
//
//  Created by Fhict on 07/10/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()


@end

@implementation SettingViewController
@synthesize switchOnOff, nameAlarm, label, scrollView, contentView, picker, radioBtn1, radioBtn2, radioBtn3;

int alarmHour;
int alarmMinute;
NSString *onOff;
NSString *string;
NSString *soundFilePath;


/*
 * Method for scrolling, the content of the scrollview(scrollView)
 * wil be size of the uiView(contentView)
 */
-(void)viewDidLayoutSubviews
{[super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
}

/*
 * Go back to previous controller
 */
- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


/*
 * When the switch for alarm on/off is changed, the state of the switch will be saved.
 */
- (IBAction)setSwitch:(id)sender {
   if (self.switchOnOff.selected == YES) {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setBool:NO forKey:@"OnOrOff"];
        [prefs synchronize];
    }
    if (self.switchOnOff.selected == NO){
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setBool:YES forKey:@"OnOrOff"];
        [prefs synchronize];
    }
}

/*
 * Save the preferred settings, an alert pop up will show that the settings has been made.
 */
- (IBAction)saveSetting:(id)sender {
    if (self.switchOnOff.on == YES)
    { onOff = @"YES";}
    if (self.switchOnOff.on == NO)
    { onOff = @"NO";}
    
    NSDateFormatter *hTimeFormat = [[NSDateFormatter alloc] init];
	[hTimeFormat setDateFormat:@"HH"];
	NSString *date2 = [hTimeFormat stringFromDate:self.myDatePicker.date];
	[hTimeFormat setDateFormat:@"mm"];
	NSString *date1 = [hTimeFormat
                       stringFromDate:self.myDatePicker.date];
    
	alarmHour = [date2 integerValue];
	alarmMinute = [date1 integerValue];
    
    
    string = [NSString stringWithFormat:@"%d%s%d", alarmHour,":", alarmMinute];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // saving an NSString
    [prefs setObject:self.nameAlarm.text forKey:@"nameAlarm"];
    [prefs setInteger:alarmHour forKey:@"Hour"];
    [prefs setInteger:alarmMinute forKey:@"Minute"];
    [prefs setObject:onOff forKey:@"OnOrOff"];
    [prefs setObject:soundFilePath forKey:@"soundFilePath"];
    
    
    
    // This is suggested to synch prefs, but is not needed)
    [prefs synchronize];
    
    
    //alertpopup
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Settings"
                                                    message:@"Your settings has been saved"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
     self.nameAlarm.delegate = self;

}

-(void)viewDidAppear:(BOOL)animated{
    // make some radio buttons(change properties of UIbuttons)
    [radioBtn1 setTag:0];
    [radioBtn1 setBackgroundImage:[UIImage imageNamed:@"checkedOff.png"] forState:UIControlStateNormal];
    [radioBtn1 setBackgroundImage:[UIImage imageNamed:@"checkedOn.png"] forState:UIControlStateSelected];
    [radioBtn1 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [radioBtn2 setTag:1];
    [radioBtn2 setBackgroundImage:[UIImage imageNamed:@"checkedOff.png"] forState:UIControlStateNormal];
    [radioBtn2 setBackgroundImage:[UIImage imageNamed:@"checkedOn.png"] forState:UIControlStateSelected];
    [radioBtn2 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [radioBtn3 setTag:2];
    [radioBtn3 setBackgroundImage:[UIImage imageNamed:@"checkedOff.png"] forState:UIControlStateNormal];
    [radioBtn3 setBackgroundImage:[UIImage imageNamed:@"checkedOn.png"] forState:UIControlStateSelected];
    [radioBtn3 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [radioBtn1 setSelected:YES];
    soundFilePath = @"/alarm1.mp3";

}
/*
 * When a radiobutton has been selected, the cases will be switched depending on the tag that has been 
 * set in the radiobutton.
 */
-(void)radiobuttonSelected:(id)sender {
    switch ([sender tag]) {
        case 0:
                [radioBtn1 setSelected:YES];
                [radioBtn2 setSelected:NO];
                [radioBtn3 setSelected:NO];
                 soundFilePath = @"/alarm1.mp3";
            
            break;
        case 1:
                [radioBtn2 setSelected:YES];
                [radioBtn1 setSelected:NO];
                [radioBtn3 setSelected:NO];
                soundFilePath = @"/alarm2.mp3";
            
            break;
        case 2:
                [radioBtn3 setSelected:YES];
                [radioBtn1 setSelected:NO];
                [radioBtn2 setSelected:NO];
                soundFilePath = @"record";
            
            break;
        default:
            break;
    }
}
/*
 * This is for the keyboard when the user wants to change the alarm name. 
 * The keyboard will disappear after pressing return
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
