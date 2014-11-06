//
//  AlarmViewController.h
//  iWake
//
//  Created by Fhict on 07/10/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface AlarmViewController : UIViewController

// Properties
// ==========
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UISwitch *switchOnOff;
@property (weak, nonatomic) IBOutlet UILabel *nameAlarm;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


// Methods
// =======
- (void)onTick:timer;
- (IBAction)switchValueChanged:(id)sender;



@end
