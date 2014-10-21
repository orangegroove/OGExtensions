//
//  OGExtensionsCommon.m
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

#import "OGExtensionsCommon.h"

#define ARC4RANDOM_MAX	UINT32_MAX

int32_t OGRandom(int32_t low, int32_t high)
{
	if (low >= 0 && high <= INT32_MAX)
		return arc4random_uniform(high - low + 1) + low;
	
	return arc4random() % (high - low + 1) + low;
}

double OGRandomDouble(double low, double high)
{
	return ((double)arc4random() / (double)ARC4RANDOM_MAX) * (high - low) + low;
}

double OGRound(double number, int decimals)
{
	NSInteger step = (NSInteger)powf(10.f, (float)decimals);
	
	return floor(number * step + 0.5) / step;
}
