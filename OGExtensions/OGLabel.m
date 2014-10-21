//
//  OGLabel.m
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

#import "OGLabel.h"

@interface OGLabel ()

@property (assign, nonatomic) CGFloat	maximumFontSize;
@property (assign, nonatomic) BOOL		dontUpdateMaximumFontSize;

- (void)setFontWithSize:(CGFloat)size;
- (void)setFontSizeToFitMultilineText;

@end
@implementation OGLabel

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
	if (self)
    {
		self.maximumFontSize = self.font.pointSize;
	}
	
	return self;
}

#pragma mark - Drawing

- (void)drawTextInRect:(CGRect)rect
{
	[super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
}

#pragma mark - Private

- (void)setFontWithSize:(CGFloat)size
{
	self.dontUpdateMaximumFontSize = YES;
	self.font                      = [self.font fontWithSize:size];
}

- (void)setFontSizeToFitMultilineText
{
    NSString* text   = self.text;
    CGFloat fontSize = self.maximumFontSize;
	
	if (!text.length)
    {
		[self setFontWithSize:fontSize];
		return;
	}
	
    CGSize labelSize = UIEdgeInsetsInsetRect(self.bounds, self.textInsets).size;
    CGSize testSize  = labelSize;
    testSize.height  = CGFLOAT_MAX;
	
	do
    {
        UIFont* font = [self.font fontWithSize:fontSize];
        CGSize size  = [text boundingRectWithSize:testSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: self.textColor} context:nil].size;
		
		if (size.width <= labelSize.width && size.height <= labelSize.height)
        {
			[self setFontWithSize:fontSize];
			return;
		}
		
		fontSize--;
		
	} while (fontSize > 0.f);
	
	[self setFontWithSize:1.f];
}

#pragma mark - Properties

- (void)setText:(NSString *)text
{
	[super setText:text];
	
	if (self.numberOfLines != 1 && self.adjustsFontSizeToFitMultilineWidth && text.length)
    {
        [self setFontSizeToFitMultilineText];
    }
	else if (self.adjustsFontSizeToFitMultilineWidth)
    {
        self.font = [self.font fontWithSize:self.maximumFontSize];
    }
}

- (void)setFont:(UIFont *)font
{
	[super setFont:font];
	
	if (self.dontUpdateMaximumFontSize)
    {
		self.dontUpdateMaximumFontSize = NO;
		return;
	}
	
	self.maximumFontSize = font.pointSize;
}

- (void)setTextInsets:(UIEdgeInsets)textInsets
{
	_textInsets = textInsets;
	
	if (self.numberOfLines != 1 && self.adjustsFontSizeToFitMultilineWidth && self.text.length)
    {
        [self setFontSizeToFitMultilineText];
    }
	else
    {
        [self setNeedsDisplay];
    }
}

- (void)setAdjustsFontSizeToFitMultilineWidth:(BOOL)adjustsFontSizeToFitMultilineWidth
{
	_adjustsFontSizeToFitMultilineWidth = adjustsFontSizeToFitMultilineWidth;
	
	if (adjustsFontSizeToFitMultilineWidth && self.numberOfLines != 1 && self.text.length)
    {
        [self setFontSizeToFitMultilineText];
    }
	else
    {
        self.font = [self.font fontWithSize:self.maximumFontSize];
    }
}

@end
