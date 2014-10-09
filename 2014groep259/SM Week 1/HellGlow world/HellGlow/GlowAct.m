//
//  GlowAct.m
//  HelloGlow
//
//  Created by Fhict on 09/09/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import "GlowAct.h"

@implementation GlowAct

@synthesize name;
@synthesize startTime;
@synthesize rating;

-(NSString *) ShowInfo
{

    return [NSString stringWithFormat:@"The act is called %@ and will start %@. People gave it a rating of %ld",
    name, startTime, rating];
}

@end
