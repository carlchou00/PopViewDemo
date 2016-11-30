//
//  DislikeModel.h
//  KG_Video
//
//  Created by 邢汉杰 on 2016/11/29.
//  Copyright © 2016年 快更. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DislikeModel : NSObject

@property (nonatomic, assign) NSInteger dislikeId;
@property (nonatomic,   copy) NSString  *dislikeText;

+ (void)saveDislikeReasonFromResponseObject:(id)object;
+ (NSArray *)readDislikeReasons;

@end
