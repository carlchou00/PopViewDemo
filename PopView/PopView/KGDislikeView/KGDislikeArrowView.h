//
//  KGDislikeArrowView.h
//  KG_Video
//
//  Created by 邢汉杰 on 2016/11/15.
//  Copyright © 2016年 快更. All rights reserved.
//

#define kArrowHeight    (8.0)
#define kArrowWidth     (16.0)

#define kScale   (0.7)

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KGDislikeArrowDirection) {
    KGDislikeArrowDirectionDown = 0,
    KGDislikeArrowDirectionUp
};

@interface KGDislikeArrowView : UIView

+ (instancetype)arrowViewWithFrame:(CGRect)frame arrowDirection:(KGDislikeArrowDirection)arrowDirection;

@end
