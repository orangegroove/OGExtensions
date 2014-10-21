//
//  UIView+OGExtensions.h
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

@import UIKit;

@interface UIView (OGExtensions)

/**
 Returns a subview of specified class.
 @param classname The name of the class
 @return The first subview found or nil if none are found
 */
- (id)subviewWithClassname:(NSString *)classname;

/**
 Returns the subview which is first responder.
 @return The first responder or nil if not found
 */
- (UIView *)firstResponderSubview;

/**
 Rounds corners of a view.
 @param corners Which corners to round
 @param radius The rounding radius
 */
- (void)roundCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;

/**
 Adds a view to the current view hierarchy, but makes sure its display position on the screen is preserved.
 @param view The view to add
 @note If the view is not currently displayed, this method functions as addSubview:
 */
- (void)addSubviewWithPreservedScreenPosition:(UIView *)view;

/**
 Sets the frame of a view by setting its bounds and its center.
 @param frame The new frame
 @note This is useful when the frame property is undefined. I.e., when the view's transform is set.
 */
- (void)setFrameSafely:(CGRect)frame;

@end
