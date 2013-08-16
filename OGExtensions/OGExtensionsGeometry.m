//
//  OGExtensionsGeometry.m
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

#import "OGExtensionsGeometry.h"

CGRect CGRectRetinaIntegral(CGRect rect)
{
	rect.origin.x		= floorf(CGRectGetMinX  (rect) * 2) / 2;
	rect.origin.y		= floorf(CGRectGetMinY  (rect) * 2) / 2;
	rect.size.width		=  ceilf(CGRectGetWidth (rect) * 2) / 2;
	rect.size.height	=  ceilf(CGRectGetHeight(rect) * 2) / 2;
	
	return rect;
}

CGPoint CGRectGetCenter(CGRect rect)
{
	return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGPoint CGRectGetUpperLeft(CGRect rect)
{
	return CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetLowerLeft(CGRect rect)
{
	return CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetUpperRight(CGRect rect)
{
	return CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetLowerRight(CGRect rect)
{
	return CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetMidLeft(CGRect rect)
{
	return CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
}

CGPoint CGRectGetMidRight(CGRect rect)
{
	return CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
}

CGPoint CGRectGetMidTop(CGRect rect)
{
	return CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetMidBottom(CGRect rect)
{
	return CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
}
