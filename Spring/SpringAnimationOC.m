//
//  SpringAnimationOC.m
//  CareVoice
//
//  Created by Hanguang on 7/28/15.
//  Copyright (c) 2015 CareVoice. All rights reserved.
//

#import "SpringAnimationOC.h"

@implementation SpringAnimationOC

+ (void)springWith:(NSTimeInterval)duration animation:(void (^)())animation {
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animation();
    } completion:nil];
}

+ (void)springEaseInWith:(NSTimeInterval)duration animation:(void (^)())animation {
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animation();
    } completion:nil];
}

+ (void)springEaseOutWith:(NSTimeInterval)duration animation:(void (^)())animation {
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        animation();
    } completion:nil];
}

+ (void)springEaseInOutWith:(NSTimeInterval)duration animation:(void (^)())animation {
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animation();
    } completion:nil];
}

+ (void)springLinearWith:(NSTimeInterval)duration animation:(void (^)())animation {
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        animation();
    } completion:nil];
}

+ (void)springWith:(NSTimeInterval)duration delay:(NSTimeInterval)dealy animation:(void (^)())animation {
    [UIView animateWithDuration:duration delay:dealy usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animation();
    } completion:nil];
}

+ (void)springWithCompletion:(NSTimeInterval)duration delay:(NSTimeInterval)dealy
         animation:(void (^)())animation completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animation();
    } completion:^(BOOL finished) {
        completion(finished);
    }];
    
}

@end
