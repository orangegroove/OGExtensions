//
//  OGExtensionsCommon.h
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

#pragma mark - Macros

#define MIN3(x,y,z)				MIN(MIN(x,y),z)
#define MAX3(x,y,z)				MAX(MAX(x,y),z)
#define MID(min,x,max)			MAX(MIN(x, max), min)
#define _radians(degrees)		(M_PI * (degrees) / 180.0)
#define _degrees(radians)		(180.0 * (radians) / M_PI)
#define weakify(object)			__weak typeof(object) w ## object = object

#pragma mark - Types

typedef void	(^OGVoidBlock)(void);
typedef void	(^OGSuccessBlock)(BOOL success);
typedef id		(^OGObjectMapBlock)(id object);
typedef BOOL	(^OGObjectMatchBlock)(id object);

#pragma mark - Functions

/** @name Functions */

/**
 Returns a random integer.
 @param low The lowest possible return value
 @param high The highest possible return value
 @return
 */
int32_t		OGRandom(int32_t low, int32_t high);

/**
 Returns a random double.
 @param low The lowest possible return value
 @param high The highest possible return value
 @return
 */
double			OGRandomDouble(double low, double high);

/**
 Returns a rounded double
 @param The number to round
 @param Rounding precision
 @return
 */
double			OGRound(double number, int decimals);
