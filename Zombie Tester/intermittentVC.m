//
//  intermittentVC.m
//  Zombie Tester
//
//  Created by Daniel Demiss on 28.12.11.
//  Copyright (c) 2011 CELLULAR GmbH. All rights reserved.
//

#import "intermittentVC.h"
#import "helper.h"

@implementation intermittentVC

+ (void)load
{
	DumpMethods(self);
}

- (void)dealloc
{
	NSLog(@"I'm the intermettent dealloc");
	LogStacktrace();

#ifdef DO_NOT_USE_ARC
	NSLog(@"I shouldn't be called in ARC");
	[foo_ release];
	[super dealloc];
#endif
}

- (void)SpecialsemaphoreMethod
{
	NSLog(@"w00t");
}

@end
