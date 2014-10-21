//
//  OGExtensionsGeometry.h
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

@import CoreGraphics;

/** @name Geometry */

/**
 Returns a rectangle with values rounded to the nearest half point.
 @param rect The rectangle to modify
 @return The modified rectangle
 */
CG_EXTERN CGRect CGRectRetinaIntegral(CGRect rect);

/** @name */

/**
 Returns half the width of a rectangle
 @param rect The rectangle
 @return Half the width
 */
CG_EXTERN CGFloat CGRectGetHalfWidth(CGRect rect);

/**
 Returns half the height of a rectangle
 @param rect The rectangle
 @return Half the height
 */
CG_EXTERN CGFloat CGRectGetHalfHeight(CGRect rect);

/**
 Returns the center of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetCenter(CGRect rect);

/**
 Returns the upper left corner of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetUpperLeft(CGRect rect);

/**
 Returns the lower left corner of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetLowerLeft(CGRect rect);

/**
 Returns the upper right corner of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetUpperRight(CGRect rect);

/**
 Returns the lower right corner of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetLowerRight(CGRect rect);

/**
 Returns the middle of the left line of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetMidLeft(CGRect rect);

/**
 Returns the middle of the right line of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetMidRight(CGRect rect);

/**
 Returns the middle of the top line of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetMidTop(CGRect rect);

/**
 Returns the middle of the bottom line of the rectangle.
 @param rect The rectangle
 @return
 */
CG_EXTERN CGPoint CGRectGetMidBottom(CGRect rect);

/**
 Return true if `size1' and `size2' are almost the same, false otherwise.
 @param size1 One size.
 @param size2 Another size.
 @param diff Difference allowed.
 @return 
 */
CG_EXTERN bool CGSizeFuzzyEqualToSize(CGSize size1, CGSize size2, CGFloat diff);
