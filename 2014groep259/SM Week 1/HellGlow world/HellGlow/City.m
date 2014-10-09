//
//  City.m
//  HelloGlow
//
//  Created by Fhict on 09/09/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import "City.h"
#import "GlowAct.h"

@implementation City

@synthesize name;
@synthesize population;
@synthesize glowActs;

-(void) ShowInfo
{
      NSMutableArray * result = [[NSMutableArray alloc] init];
      for (GlowAct *acts in glowActs)
      {
          [result addObject:[acts ShowInfo]];
      }
    
    NSLog(@"In the city of %@ there are currently living %ld people and the information of all glow acts are: %@", name, (long)population, result);
}

-(id) init
{
    if(self == [super init])
    {
        glowActs = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
