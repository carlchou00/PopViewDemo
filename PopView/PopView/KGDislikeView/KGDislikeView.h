//
//  KGDislikeView.h
//  test
//
//  Created by 邢汉杰 on 2016/11/15.
//  Copyright © 2016年 邢汉杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DislikeModel.h"

@class KGDislikeView;
typedef void(^KGDislikeViewBlock)(KGDislikeView *dislikeView, NSString *reasonString);

@interface KGDislikeView : UIView

+ (instancetype)showFromView:(UIView *)aView items:(NSArray <DislikeModel *> *)items dislikeBlock:(KGDislikeViewBlock)dislikeBlock;

@end
