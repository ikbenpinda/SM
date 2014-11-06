//
//  StartViewController.h
//  iWake
//
//  Created by Fhict on 05/11/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

// Properties
// ==========
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

// Methods
// =======
- (void)viewDidLayoutSubviews;
@end
