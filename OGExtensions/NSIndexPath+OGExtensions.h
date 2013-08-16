//
//  NSIndexPath+OGExtensions.h
//  OGExtensionsExample
//
//  Created by Jesper on 7/27/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (OGExtensions)

/**
 Shorthand for modifying indexPath. Preserves the item.
 @param section The section.
 @return The new indexpath.
 */
- (NSIndexPath *)indexPathWithSection:(NSInteger)section;

/**
 Shorthand for modifying indexPath. Preserves the section.
 @param item The item
 @return The new indexpath.
 */
- (NSIndexPath *)indexPathWithItem:(NSInteger)item;

/**
 Shorthand for modifying indexPath. Preserves the item.
 @param inc How much to increment or decrement the section.
 @return The new indexpath.
 */
- (NSIndexPath *)indexPathByIncrementingSection:(NSInteger)inc;

/**
 Shorthand for modifying indexPath. Preserves the section.
 @param inc How much to increment or decrement the item.
 @return The new indexpath.
 */
- (NSIndexPath *)indexPathByIncrementingItem:(NSInteger)inc;

/**
 Shorthand for modifying indexPath.
 @param incSection How much to increment or decrement the section.
 @param incItem How much to increment or decrement the item.
 @return The new indexpath.
 */
- (NSIndexPath *)indexPathByIncrementingSection:(NSInteger)incSection andItem:(NSInteger)incItem;

@end
