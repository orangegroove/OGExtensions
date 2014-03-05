//
//  UIView+OGExtensions.m
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

#import <QuartzCore/QuartzCore.h>
#import "UIView+OGExtensions.h"

@implementation UIView (OGExtensions)

- (id)subviewWithClassname:(NSString *)classname
{
	for (UIView* view in self.subviews) {
		
		if ([classname isEqualToString:NSStringFromClass(view.class)])
			return view;
		
		UIView* subview = [view subviewWithClassname:classname];
		
		if (subview)
			return subview;
	}
	
	return nil;
}

- (UIView *)firstResponderSubview
{
	if (self.isFirstResponder)
		return self;
	
	for (UIView* view in self.subviews) {
		
		UIView* responder = view.firstResponderSubview;
		
		if (responder)
			return responder;
	}
	
	return nil;
}

- (void)roundCorners:(UIRectCorner)corners withRadius:(CGFloat)radius
{
	CGSize radii		= CGSizeMake(radius, radius);
	CAShapeLayer* mask	= [CAShapeLayer layer];
	UIBezierPath* path	= [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
	mask.path			= path.CGPath;
	self.layer.mask		= mask;
}

- (void)addSubviewWithPreservedScreenPosition:(UIView *)view
{
	if (view.superview)
		view.center = [self convertPoint:view.center fromView:view.superview];
	
	[self addSubview:view];
}

- (void)setFrameSafely:(CGRect)frame
{
	self.bounds	= (CGRect){0.f, 0.f, frame.size};
	self.center	= CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
}

@end
