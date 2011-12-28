//
//  helper.h
//  Zombie Tester
//
//  Created by Daniel Demiss on 28.12.11.
//  Copyright (c) 2011 CELLULAR GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <execinfo.h>
#import <objc/runtime.h>

static inline void LogStacktrace ()
{
	size_t maxDepth = 128;
	void *stackFrames[maxDepth];
	
	size_t numberOfFrames = backtrace(stackFrames, maxDepth);
	char **symbols = backtrace_symbols(stackFrames, numberOfFrames);
	
	NSMutableString *stacktrace = [NSMutableString stringWithString:@"Complete stacktrace:\n"];
	for (size_t frame = 0; frame < numberOfFrames; frame++) {
		[stacktrace appendFormat:@"%s\n", symbols[frame]];
	}
	
	NSLog(@"%@", stacktrace);
}

static inline void DumpMethods(Class theClass)
{
	unsigned int methodCount;

	Method *methods = class_copyMethodList(theClass, &methodCount);
	@autoreleasepool {
		NSMutableString *methodList = [NSMutableString stringWithFormat:@"Method list for class %s:\n", class_getName(theClass)];
		for (unsigned int methodIndex = 0; methodIndex < methodCount; methodIndex++) {
			SEL selector = method_getName(methods[methodIndex]);
			[methodList appendString:NSStringFromSelector(selector)];

			[methodList appendString:@"\n"];
		}

		NSLog(@"%@", methodList);
	}
	free(methods);
}