//
//  AlarmViewController.m
//  iWake
//
//  Created by Fhict on 07/10/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import "AlarmViewController.h"
#define myAlertViewsTag 0

@interface AlarmViewController ()
@end

@implementation AlarmViewController
@synthesize contentView, scrollView, switchOnOff, nameAlarm, timeLabel;


NSString *string;
NSString *hour;
NSString *min;
NSTimer *timer;
NSTimer *timer2;
NSString *sFilePath;
NSURL *soundFileURL;


/*
 * Method for scrolling, the content of the scrollview(scrollView)
 * wil be size of the uiView(contentView)
 */
-(void)viewDidLayoutSubviews
{[super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



/*
 * For every timer tick(1 sec), the labels will be updated and 
 * if the alarm time and the current time is the same, the alarm will go off and an alert pop up will be shown.
 */
-(void)onTick:timer {

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    self.nameAlarm.text = [prefs stringForKey:@"nameAlarm"];
    hour = [prefs stringForKey:@"Hour"];
    int countHour = [hour length];
    if(countHour == 1)
    {
        hour = [NSString stringWithFormat:@"0%@",hour];
    }
    min = [prefs stringForKey:@"Minute"];
    int countMinute = [min length];
    if(countMinute == 1)
    {
        min = [NSString stringWithFormat:@"0%@",min];
    }
    self.timeLabel.text = [NSString stringWithFormat:@"%@:%@",hour, min];
    
    sFilePath = [prefs stringForKey:@"soundFilePath"];
    
    string = [prefs stringForKey:@"OnOrOff"];
    
    //set state of the switch
    if([string isEqualToString:@"YES"]){
        [self.switchOnOff setOn:YES animated:YES];;
    }
    if([string isEqualToString:@"NO"]){
        [self.switchOnOff setOn:NO animated:YES];}
    
    //parse current time in strings
    NSDateFormatter *hTimeFormat = [[NSDateFormatter alloc] init];
	[hTimeFormat setDateFormat:@"HH"];
	NSString *currentHour = [hTimeFormat stringFromDate:[NSDate date]];
	[hTimeFormat setDateFormat:@"mm"];
	NSString *currentMinutes = [hTimeFormat
                       stringFromDate:[NSDate date]];
    [hTimeFormat setDateFormat:@"ss"];
	NSString *currentSeconds = [hTimeFormat
                                stringFromDate:[NSDate date]];
    
    
    //compare current time with the time that has been saved through settings
    if([currentHour isEqualToString: hour] && [currentMinutes isEqualToString: min] && [currentSeconds isEqualToString: @"00"] &&[string isEqualToString:@"YES"])
    {
    //start audio file
        if([sFilePath isEqualToString:@"record"])
            {
                NSURL *soundFilePath = [prefs URLForKey:@"recordPathFile"];
                soundFileURL = soundFilePath;}
        
        else
            {
                NSString *soundFilePath = [NSString stringWithFormat:@"%@%@",
                                [[NSBundle mainBundle] resourcePath], sFilePath];
                soundFileURL = [NSURL fileURLWithPath:soundFilePath];}
        {
        
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                                       error:nil];
        self.audioPlayer.numberOfLoops = -1; //Infinite
        
        [self.audioPlayer play];}
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alarm"
                                                    message:@"Time to wake up"
                                                   delegate :self
                                          cancelButtonTitle:@"Stop"
                                          otherButtonTitles:nil];
    alert.tag = myAlertViewsTag;
    [alert show];
    //[alert release];
    }
    
}

/*
 * When the user press stop(alert pop up) when the alarm has gone off, the alarm sound will be stopped.
 */
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (alertView.tag == myAlertViewsTag) {
        if (buttonIndex == 0) {
            [self.audioPlayer stop];
        }
        else {
            // Do something for ok
        }
    } else {
        // Do something with responses from other alertViews
    }
}

/*
 * If the user change the on/off switch, the state of that switch will be saved
 */
- (IBAction)switchValueChanged:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if (self.switchOnOff.on == YES){
        string = @"YES";
        [prefs setObject:string forKey:@"OnOrOff"];}
    if (self.switchOnOff.on == NO){
        string = @"NO";
        [prefs setObject:string forKey:@"OnOrOff"];}
    [prefs synchronize];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    //update labels
    
    // getting an NSString
    self.nameAlarm.text = [prefs stringForKey:@"nameAlarm"];
    hour = [prefs stringForKey:@"Hour"];
    int countHour = [hour length];
    if(countHour == 1)
    {
        hour = [NSString stringWithFormat:@"0%@",hour];
    }
    min = [prefs stringForKey:@"Minute"];
    int countMinute = [min length];
    if(countMinute == 1)
    {
        min = [NSString stringWithFormat:@"0%@",min];
    }
    self.timeLabel.text = [NSString stringWithFormat:@"%@:%@",hour, min];
    
    sFilePath = [prefs stringForKey:@"soundFilePath"];
    
    string = [prefs stringForKey:@"OnOrOff"];
    
    if([string isEqualToString:@"YES"]){
        [self.switchOnOff setOn:YES animated:YES];;
    }
    if([string isEqualToString:@"NO"]){
        [self.switchOnOff setOn:NO animated:YES];}


    //timer will be set
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(onTick:)
                                   userInfo:nil
                                    repeats:YES];
    // Do any additional setup after loading the view.

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
