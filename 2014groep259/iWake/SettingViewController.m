//
//  SettingViewController.m
//  iWake
//
//  Created by Fhict on 07/10/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import "SettingViewController.h"
#import "AlarmViewController.h"
#import "AFNetworking.h"
#import "Alarm.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SettingViewController

int alarmHour;
int alarmMinute;
NSString *string;



- (IBAction)saveSetting:(id)sender {
}


- (void) loadJsonData
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //The server returns an invalid header. This fixes that problem.
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/x-javascript"];
    
    [manager GET:@"http://athena.fhict.nl/users/i886625/pirates.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //This code is executed when the result was ok.
        NSLog(@"JSON: %@", responseObject);
        [self parseJSONData:responseObject];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //This code is executed when there was an error.
        NSLog(@"Error: %@", error);
        
    }];
}


-(void) parseJSONData:(id) JSON
{
    NSMutableArray *alarms = [[NSMutableArray alloc] init];
    
    //Loop through all objects in JSON array
    for (NSDictionary* dict in JSON) {
        //Create a alarm object where the json data can be stored
        Alarm *alarm = [[Alarm alloc] init];
        //Get the JSON data from the dictionary and store it at the Alarm object
        alarm.datum= [dict objectForKey:@"datum"];
        alarm.onOrOff = [dict objectForKey:@"on_or_off"];
        alarm.soundFilePath = [dict objectForKey:@"sound_filepath"];
        
        //Add the alarm to the array
        [alarms addObject:alarm];
    }
    
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
    [self.myDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
  //  NSDate *storedDate = [[NSUserDefaults standardUserDefaults] //objectForKey:@"DatePickerViewController.selectedDate"];
    //[self.myDatePicker setDate:storedDate animated:NO];
    // Do any additional setup after loading the view.
}
-(void)getDate
{
    NSDateFormatter *hTimeFormat = [[NSDateFormatter alloc] init];
	[hTimeFormat setDateFormat:@"HH"];
	NSString *date2 = [hTimeFormat stringFromDate:self.myDatePicker.date];
	[hTimeFormat setDateFormat:@"mm"];
	NSString *date1 = [hTimeFormat
                       stringFromDate:self.myDatePicker.date];
    
	alarmHour = [date2 integerValue];
	alarmMinute = [date1 integerValue];
    string = [NSString stringWithFormat:@"%d%s%d", alarmHour,":", alarmMinute];
    self.label.text = string;

}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    [self getDate];    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDate *selectedDate = [self.myDatePicker date];
    [defaults setObject:selectedDate forKey:@"DatePickerViewController.selectedDate"];
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
