//
//  NSString+OGExtensions.m
//
//  Created by Jesper <jesper@orangegroove.net>
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
		NSString* key	= item.count > 0? item[0] : nil;
		NSString* value	= item.count > 1? item[1] : @"";
		
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

- (NSString *)stringRepeated:(NSUInteger)repeatCount
{
	if (!repeatCount)
		return nil;
	
	if (repeatCount == 1)
		return self;
	
	NSMutableString* string = [NSMutableString stringWithCapacity:self.length * repeatCount];
	
	for (NSUInteger i = 0; i < repeatCount; i++)
		[string appendString:self];
	
	return [NSString stringWithString:string];
}

- (NSString *)substringFromString:(NSString *)string searchFromEnd:(BOOL)searchFromEnd
{
	return [self substringBetweenString:string andString:@"" searchFromEnd:searchFromEnd];
}

- (NSString *)substringToString:(NSString *)string searchFromEnd:(BOOL)searchFromEnd
{
	return [self substringBetweenString:@"" andString:string searchFromEnd:searchFromEnd];
}

- (NSString *)substringBetweenString:(NSString *)startString andString:(NSString *)endString searchFromEnd:(BOOL)searchFromEnd
{
	if (!self.length)
		return nil;
	
	NSStringCompareOptions options	= searchFromEnd? NSBackwardsSearch : 0;
	NSRange start					= [self rangeOfString:startString options:options];
	
	if (!start.length)
		start = NSMakeRange(0, 0);
	
	NSUInteger startEnd	= start.location + start.length;
	NSRange end			= [self rangeOfString:endString options:options range:NSMakeRange(startEnd, self.length-startEnd)];
	
	if (!end.length)
		end = NSMakeRange(startEnd, end.location - startEnd);
	
	return [self substringWithRange:NSMakeRange(startEnd, end.location - startEnd)];
}

@end
