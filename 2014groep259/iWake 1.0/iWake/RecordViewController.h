//
//  RecordViewController.h
//  iWake
//
//  Created by Fhict on 04/11/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RecordViewController : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>

// Properties
// ==========
@property (strong, nonatomic) IBOutlet UIButton *btRecord;
@property (strong, nonatomic) IBOutlet UIButton *btStop;
@property (strong, nonatomic) IBOutlet UIButton *btPlay;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

// Methods
// =======

- (IBAction)recordPressed:(id)sender;
- (IBAction)stopPressed:(id)sender;
- (IBAction)playPressed:(id)sender;
- (void)viewDidLayoutSubviews;
@end
