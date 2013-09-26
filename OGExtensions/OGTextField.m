//
//  OGTextField.m
//  OGExtensionsProject
//
//  Created by Jesper on 9/26/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import "OGTextField.h"

@implementation OGTextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
	return UIEdgeInsetsInsetRect(bounds, self.textInsets);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
	return UIEdgeInsetsInsetRect(bounds, self.textInsets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
	return UIEdgeInsetsInsetRect(bounds, self.textInsets);
}

@end
