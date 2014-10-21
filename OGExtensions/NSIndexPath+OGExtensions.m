//
//  NSIndexPath+OGExtensions.m
//  OGExtensionsExample
//
//  Created by Jesper on 7/27/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import "NSIndexPath+OGExtensions.h"

@implementation NSIndexPath (OGExtensions)

- (NSIndexPath *)og_indexPathWithSection:(NSInteger)section
{
	return [NSIndexPath indexPathForItem:self.item inSection:section];
}

- (NSIndexPath *)og_indexPathWithItem:(NSInteger)item
{
	return [NSIndexPath indexPathForItem:item inSection:self.section];
}

- (NSIndexPath *)og_indexPathByIncrementingSection:(NSInteger)inc
{
	return [NSIndexPath indexPathForItem:self.item inSection:self.section + inc];
}

- (NSIndexPath *)og_indexPathByIncrementingItem:(NSInteger)inc
{
	return [NSIndexPath indexPathForItem:self.item + inc inSection:self.section];
}

- (NSIndexPath *)og_indexPathByIncrementingSection:(NSInteger)incSection andItem:(NSInteger)incItem
{
	return [NSIndexPath indexPathForItem:self.item + incItem inSection:self.section + incSection];
}

@end
