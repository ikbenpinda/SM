//
//  WeatherViewController.m
//  iWake
//
//  Created by Fhict on 04/11/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import "WeatherViewController.h"
#import "Weather.h"

@interface WeatherViewController (
                                  )

@end

@implementation WeatherViewController
{    Weather *theWeather;}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize scrollView, contentView;

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
 * Show the weather details of 'Eindhoven' in a alert pop up view
 */
- (IBAction)btShowWeather:(id)sender {
    
    [theWeather getCurrent:@"Eindhoven"];  //Still has to change to local gps
    
    NSString *report = [NSString stringWithFormat:
                        @"Weather in %@:\n"
                        @"%@\n"
                        @"Current temp.: %2.1f C\n"
                        @"High: %2.1f C\n"
                        @"Low: %2.1f C\n",
                        theWeather.city,
                        theWeather.conditions[0][@"description"],
                        theWeather.tempCurrent,
                        theWeather.tempMax,
                        theWeather.tempMin
                        ];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current Weather"
                                                    message:report
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    theWeather = [[Weather alloc] init];
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
