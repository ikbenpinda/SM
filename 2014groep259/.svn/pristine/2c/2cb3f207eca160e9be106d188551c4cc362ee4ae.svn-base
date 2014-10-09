//
//  main.m
//  HellGlow
//
//  Created by Fhict on 09/09/14.
//  Copyright (c) 2014 Fhict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlowAct.h"
#import "City.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        GlowAct *blueLightAct = [[GlowAct alloc]init];
        blueLightAct.name = @"The Bluelight act";
        blueLightAct.startTime = @"22:00";
        blueLightAct.rating = 8;
        
        GlowAct *anotherGlowAct = [[GlowAct alloc]init];
        anotherGlowAct.name = @"Another glow act";
        anotherGlowAct.startTime = @"16:00";
        anotherGlowAct.rating = 10;
        
        
        City *eindhoven = [[City alloc]init];
        eindhoven.name = @"Eindhoven";
        eindhoven.population = 220000;
        
        [blueLightAct ShowInfo];
        [eindhoven.glowActs addObject:blueLightAct];
        [eindhoven.glowActs addObject:anotherGlowAct];
        [eindhoven ShowInfo];
        
        
        
    }
    return 0;
}

