//
//  DislikeModel.m
//  KG_Video
//
//  Created by 邢汉杰 on 2016/11/29.
//  Copyright © 2016年 快更. All rights reserved.
//

#define kDislikeReasonKey   @"/config/dislike.json"

#import "DislikeModel.h"
//#import "KGCacheManager.h"

@implementation DislikeModel

+ (void)saveDislikeReasonFromResponseObject:(id)object {
//    [KGCacheManager saveCache:[self dataArrayFromResponseObject:object] forKey:kDislikeReasonKey];
}

+ (NSArray *)readDislikeReasons {
//    NSArray *cacheArray = [KGCacheManager cacheForKey:kDislikeReasonKey];
//    if (cacheArray.count) {
//        return cacheArray;
//    }
    NSArray *defaultReasonTitles = @[@"重复 旧闻", @"低俗 重口", @"内容质量差", @"不喜欢该类型内容"];
    NSMutableArray *defaultReasons = [NSMutableArray array];
    for (NSInteger idx = 0; idx < defaultReasonTitles.count; idx++) {
        DislikeModel *dislike = [self new];
        dislike.dislikeId = idx + 1;
        dislike.dislikeText = defaultReasonTitles[idx];
        [defaultReasons addObject:dislike];
    }
    return [defaultReasons copy];
}

@end
