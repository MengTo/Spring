//
//  SpringAnimationOC.h
//  CareVoice
//
//  Created by Hanguang on 7/28/15.
//  Copyright (c) 2015 CareVoice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpringAnimationOC : NSObject

+ (void)springWith:(NSTimeInterval)duration animation:(void (^)())animation;

+ (void)springEaseInWith:(NSTimeInterval)duration animation:(void (^)())animation;

+ (void)springEaseOutWith:(NSTimeInterval)duration animation:(void (^)())animation;

+ (void)springEaseInOutWith:(NSTimeInterval)duration animation:(void (^)())animation;

+ (void)springLinearWith:(NSTimeInterval)duration animation:(void (^)())animation;

+ (void)springWith:(NSTimeInterval)duration delay:(NSTimeInterval)dealy animation:(void (^)())animation;

+ (void)springWithCompletion:(NSTimeInterval)duration delay:(NSTimeInterval)dealy
                   animation:(void (^)())animation completion:(void (^)(BOOL finished))completion;

@end
