//
//  LoadingKit.h
//  LoadingKit
//
//  Created by James on 24/10/14.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LoadingKit : NSObject

// Drawing Methods
+ (void)drawLoadingWithTintColor: (UIColor*)tintColor rounds: (CGFloat)rounds progress: (CGFloat)progress minWidth: (CGFloat)minWidth maxWidth: (CGFloat)maxWidth diameter: (CGFloat)diameter;
+ (void)drawLoadingPlayground;

@end