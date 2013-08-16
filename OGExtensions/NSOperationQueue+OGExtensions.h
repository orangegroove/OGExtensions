//
//  NSOperationQueue+OGExtensions.h
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

#import <Foundation/Foundation.h>

@interface NSOperationQueue (OGExtensions)

/**
 An application-level queue.
 @return The queue
 */
+ (instancetype)sharedQueue;

/**
 Adds an operation that is is performed last, assuming no special dependencies.
 @param fifoOperation The operation to add
 @note This is the behavior of addOperation:, aliased only for symmetry.
 */
- (void)addFIFOOperation:(NSOperation *)fifoOperation;

/**
 Adds an operation that is is performed first, assuming no special dependencies.
 @param lifoOperation The operation to add
 */
- (void)addLIFOOperation:(NSOperation *)lifoOperation;

@end
