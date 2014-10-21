//
//  NSString+OGExtensions.h
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

@import Foundation;

@interface NSString (OGExtensions)

/**
 Normalizes a string.
 @return The normalized string
 @note Useful for string matching (e.g., for searching a Core Data store).
 */
- (NSString *)og_normalizedString;

/**
 Encodes a string for HTTP operations.
 @return The encoded string
 */
- (NSString *)og_urlEncodedString;

/**
 Decodes a string for HTTP operations.
 @return The decoded string
 */
- (NSString *)og_urlDecodedString;

/**
 Parses parameters from a URL.
 @return The parsed parameters
 @note Empty values are stored as zero-length strings.
 */
- (NSDictionary *)og_httpParametersFromURLString;

/**
 
 */
- (NSString *)og_stringRepeated:(NSUInteger)repeatCount;

/**
 
 */
- (NSString *)og_substringFromString:(NSString *)string searchFromEnd:(BOOL)searchFromEnd;

/**
 
 */
- (NSString *)og_substringToString:(NSString *)string searchFromEnd:(BOOL)searchFromEnd;

/**
 
 */
- (NSString *)og_substringBetweenString:(NSString *)startString andString:(NSString *)endString searchFromEnd:(BOOL)searchFromEnd;

@end
