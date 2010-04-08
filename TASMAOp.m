// TechnicalAnalysis TASMAOp.m
//
// Copyright © 2010, Roy Ratcliffe, Pioneering Software, United Kingdom
// All rights reserved
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS," WITHOUT WARRANTY OF ANY KIND, EITHER
// EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
// OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//
//------------------------------------------------------------------------------

#import "TASMAOp.h"

#import <TALib/ta_libc.h>

@implementation TASMAOp

@synthesize values;
@synthesize optInTimePeriod;
@synthesize results;

- (void)main
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	int begIdx, NBElement;
	NSUInteger numberOfValues = [[self values] count];
	size_t size = sizeof(double)*numberOfValues;
	double *doubleValues = malloc(size);
	double *doubleResults = malloc(size);
	for (NSUInteger i = 0; i < numberOfValues; i++) doubleValues[i] = [[[self values] objectAtIndex:i] doubleValue];
	TA_SMA(0, numberOfValues, doubleValues, optInTimePeriod, &begIdx, &NBElement, doubleResults);
	free(doubleValues);
	NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:NBElement];
	while (NBElement-- > 0) [numbers addObject:[NSNumber numberWithDouble:doubleResults[begIdx++]]];
	free(doubleResults);
	[self setResults:numbers];
	[pool release];
}

@end
