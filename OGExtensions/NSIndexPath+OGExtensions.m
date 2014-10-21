//
//  NSIndexPath+OGExtensions.m
//  OGExtensionsExample
//
//  Created by Jesper on 7/27/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import "NSIndexPath+OGExtensions.h"

@implementation NSIndexPath (OGExtensions)

- (NSIndexPath *)indexPathWithSection:(NSInteger)section
{
	return [NSIndexPath indexPathForItem:self.item inSection:section];
}

- (NSIndexPath *)indexPathWithItem:(NSInteger)item
{
	return [NSIndexPath indexPathForItem:item inSection:self.section];
}

- (NSIndexPath *)indexPathByIncrementingSection:(NSInteger)inc
{
	return [NSIndexPath indexPathForItem:self.item inSection:self.section + inc];
}

- (NSIndexPath *)indexPathByIncrementingItem:(NSInteger)inc
{
	return [NSIndexPath indexPathForItem:self.item + inc inSection:self.section];
}

- (NSIndexPath *)indexPathByIncrementingSection:(NSInteger)incSection andItem:(NSInteger)incItem
{
	return [NSIndexPath indexPathForItem:self.item + incItem inSection:self.section + incSection];
}

@end
