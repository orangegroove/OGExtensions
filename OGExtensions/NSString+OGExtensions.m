//
//  NSString+OGExtensions.m
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

#import "NSString+OGExtensions.h"

@implementation NSString (OGExtensions)

- (NSString *)normalizedString
{
	return self.decomposedStringWithCanonicalMapping.lowercaseString;
}

- (NSString *)URLEncodedString
{
	return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes
	(NULL, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef)@";/?:@&=+$,", kCFStringEncodingUTF8);
}

- (NSString *)URLDecodedString
{
	return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding
	(NULL, (__bridge CFStringRef)self, NULL, kCFStringEncodingUTF8);
}

- (NSDictionary *)httpParametersFromURLString
{
	NSArray* dichotomy = [self componentsSeparatedByString:@"?"];
	
	if (dichotomy.count < 2)
		return @{};
	
	NSArray* pairs				= [dichotomy[1] componentsSeparatedByString:@"&"];
	NSMutableDictionary* params	= [NSMutableDictionary dictionary];
	
	for (NSString* pair in pairs) {
		
		NSArray* item	= [pair componentsSeparatedByString:@"="];
		NSString* key	= item.count > 0 ? item[0] : nil;
		NSString* value	= item.count > 1 ? item[1] : @"";
		
		if (key.length) {
			
			value		= [value URLDecodedString];
			id existing = params[key];
			
			if ([existing isKindOfClass:NSMutableArray.class])
				[existing addObject:value];
			else if (existing)
				params[key] = [NSMutableArray arrayWithObjects:existing, value, nil];
			else
				params[key] = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		}
	}
	
	for (NSString* key in params)
		if (key.length > 2 && [key hasSuffix:@"[]"]) {
			
			params[[key substringToIndex:key.length-2]] = params[key];
			[params removeObjectForKey:key];
		}
	
	return [NSDictionary dictionaryWithDictionary:params];
}



@end
