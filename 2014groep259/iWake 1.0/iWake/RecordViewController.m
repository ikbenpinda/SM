//
//  RecordViewController.m
//  iWake
//
//  Created by Fhict on 04/11/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController (){
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;}
@property (strong, nonatomic) IBOutlet UILabel *labelText;

@end

@implementation RecordViewController
{
}

@synthesize btPlay, btRecord, btStop, contentView, scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*
 * Method for scrolling, the content of the scrollview(scrollView)
 * wil be size of the uiView(contentView)
 */
-(void)viewDidLayoutSubviews
{[super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Disable Stop/Play button when application launches
    [btStop setEnabled:NO];
    [btPlay setEnabled:NO];
    
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // saving an NSurl
    [prefs setURL:outputFileURL forKey:@"recordPathFile"];
    
    [prefs synchronize];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
   // [recorder prepareToRecord];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * When the recording button is pressed, the recording will begin.
 */
- (IBAction)recordPressed:(id)sender {
        // Stop the audio player before recording
    if (player.playing) {
        [player stop];
    }
    
    if (!recorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        // Start recording
        [recorder record];
        [btRecord setTitle:@"Pause" forState:UIControlStateNormal];
        self.labelText.text = @"Recording...";
        
    } else {
        
        // Pause recording
        [recorder pause];
        [btRecord setTitle:@"Record" forState:UIControlStateNormal];
        self.labelText.text = @"Recording paused...";
    }
    
    [btStop setEnabled:YES];
    [btPlay setEnabled:NO];
}

/*
 * When the stop button is pressed, the recording will be stopped.
 */
- (IBAction)stopPressed:(id)sender {
    //Stop the recorder
    [recorder stop];
    
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
    self.labelText.text = @"Recording stopped";

}

/*
 * When the play button is pressed, the audio record will play.
 */
- (IBAction)playPressed:(id)sender {
    if (!recorder.recording){

        player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        [player setDelegate:self];
        [player play];
    }
}

/*
 * When the recording is done, an alertview will pop up. The stop button will be disabled 
 * and the play button will be enabled
 */
- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    [btRecord setTitle:@"Record" forState:UIControlStateNormal];
    
    [btStop setEnabled:NO];
    [btPlay setEnabled:YES];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Recording is done."
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

/*
 * When the recorded audio has finished playing, an alertview will pop up.
 */
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Finish playing the recording!"
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
