//
//  NSNotificationCenter+OGExtensions.m
//
//  Created by Jesper Skrufve <jesper@orangegroove.net>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

#import "NSNotificationCenter+OGExtensions.h"

@implementation NSNotificationCenter (OGExtensions)

- (void)postNotificationOnMainQueue:(NSNotification *)notification
{
	if ([NSThread isMainThread])
		[self postNotification:notification];
	else
		dispatch_async(dispatch_get_main_queue(), ^{
			
			[self postNotification:notification];
		});
}

- (void)postNotificationOnMainQueueName:(NSString *)aName object:(id)anObject
{
	if ([NSThread isMainThread])
		[self postNotificationName:aName object:anObject];
	else
		dispatch_async(dispatch_get_main_queue(), ^{
			
			[self postNotificationName:aName object:anObject];
		});
}

- (void)postNotificationOnMainQueueName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
	if ([NSThread isMainThread])
		[self postNotificationName:aName object:anObject userInfo:aUserInfo];
	else
		dispatch_async(dispatch_get_main_queue(), ^{
			
			[self postNotificationName:aName object:anObject userInfo:aUserInfo];
		});
}

@end
