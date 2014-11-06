//
//  WeatherViewController.h
//  iWake
//
//  Created by Fhict on 04/11/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface WeatherViewController : UIViewController

// Properties
// ==========
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;


// Methods
// =======
- (void)viewDidLayoutSubviews;
- (IBAction)btShowWeather:(id)sender;

@end
