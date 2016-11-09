//
//  ZHNThresholdHelper.h
//  ZHNThresholdHelper
//
//  Created by zhn on 16/11/9.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^reloadAction)();
@interface ZHNThresholdHelper : NSObject
- (instancetype)initWithThreshold:(CGFloat)threshold everyLoadAddCount:(NSInteger)addCount reloadAction:(reloadAction)reloadAction;
@end
