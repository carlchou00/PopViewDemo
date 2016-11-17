//
//  KGDislikeView.m
//  test
//
//  Created by 邢汉杰 on 2016/11/15.
//  Copyright © 2016年 邢汉杰. All rights reserved.
//

#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width

#define KGDislikeViewHeaderHeight             (44.0)
#define KGDislikeViewItemHorizontalPadding    (10.0)
#define KGDislikeViewItemVerticalPadding      (5.0)
#define KGDislikeViewItemWidth                ((kScreenWidth - 45.0) / 2.0)
#define KGDislikeViewItemHeight               (25.0)

#import "KGDislikeView.h"
#import "KGDislikeArrowView.h"

@interface KGDislikeView ()

@property (nonatomic,   copy) NSArray            *itemTitles;
@property (nonatomic, strong) KGDislikeArrowView *arrowView;

@property (nonatomic, strong) UIView             *reasonView;

@end

@implementation KGDislikeView

static NSString *const kgDislikeReasonItemIdentifier = @"kg.dislike.reason.item";

+ (void)showFromView:(UIView *)aView itemTitles:(NSArray *)itemTitles {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIControl *backgroundControl = [UIControl new];
    backgroundControl.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    NSLog(@"%@", NSStringFromCGRect(keyWindow.bounds));
    backgroundControl.frame = keyWindow.bounds;
    [backgroundControl addTarget:self action:@selector(hide:) forControlEvents:UIControlEventTouchUpInside];
    [keyWindow addSubview:backgroundControl];
    CGRect triggerRect = [aView convertRect:aView.bounds toView:keyWindow];
    KGDislikeArrowDirection arrowDirection = KGDislikeArrowDirectionDown;
    CGFloat dislikeViewHeight = kArrowHeight + KGDislikeViewHeaderHeight + ((itemTitles.count + 1) / 2) * (KGDislikeViewItemHeight + KGDislikeViewItemVerticalPadding) + KGDislikeViewItemVerticalPadding;
    if (CGRectGetMaxY(triggerRect) + dislikeViewHeight + 20 > kScreenHeight) {
        arrowDirection = KGDislikeArrowDirectionUp;
    }
    CGRect frame = CGRectZero;
    switch (arrowDirection) {
        case KGDislikeArrowDirectionDown: {
            frame = CGRectMake(10 + (kScreenWidth - 20) / 2., CGRectGetMaxY(triggerRect) - dislikeViewHeight / 2., kScreenWidth - 20, dislikeViewHeight);
        }
            break;
        case KGDislikeArrowDirectionUp: {
            frame = CGRectMake(10 + (kScreenWidth - 20) / 2., CGRectGetMinY(triggerRect) - dislikeViewHeight + dislikeViewHeight / 2., kScreenWidth - 20, dislikeViewHeight);
        }
            break;
            
        default:
            break;
    }
    KGDislikeView *dislikeView = [[self alloc] initWithFrame:frame itemTitles:itemTitles direction:arrowDirection];
    [backgroundControl addSubview:dislikeView];
    dislikeView.alpha = 0.0;
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        dislikeView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        dislikeView.alpha = 1.0;
        backgroundControl.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.12];
    } completion:^(BOOL finished) {
        
    }];
}

+ (void)hide:(UIControl *)control {
    for (UIView *subview in control.subviews) {
        if ([subview isKindOfClass:[KGDislikeView class]]) {
            KGDislikeView *dislikeView = (KGDislikeView *)subview;
            [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
                dislikeView.transform = CGAffineTransformMakeScale(0.000001, 0.000001);;
                dislikeView.alpha = 0.0;
                control.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
            } completion:^(BOOL finished) {
                [control removeFromSuperview];
            }];
            return;
        }
    }
    [control removeFromSuperview];
}

- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray *)itemTitles direction:(KGDislikeArrowDirection)direction {
    self = [super initWithFrame:frame];
    if (self) {
        self.itemTitles = itemTitles;
        CGRect arrowFrame = CGRectZero;
        CGRect collectionFrame = CGRectZero;
        switch (direction) {
            case KGDislikeArrowDirectionDown: {
                self.layer.anchorPoint = CGPointMake(1.0, 0);
                arrowFrame = CGRectMake(frame.size.width - (kArrowWidth * (1 + kScale)), 0, kArrowWidth, kArrowHeight);
                collectionFrame = CGRectMake(0, kArrowHeight, frame.size.width, frame.size.height - kArrowHeight);
            }
                break;
            case KGDislikeArrowDirectionUp: {
                self.layer.anchorPoint = CGPointMake(1.0, 1.0);
                arrowFrame = CGRectMake(frame.size.width - (kArrowWidth * (1 + kScale)), frame.size.height - kArrowHeight, kArrowWidth, kArrowHeight);
                collectionFrame = CGRectMake(0, 0, frame.size.width, frame.size.height - kArrowHeight);
            }
                break;
                
            default:
                break;
        }
        self.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        [self buildReasonViewWithFrame:collectionFrame];
        KGDislikeArrowView *arrowView = [KGDislikeArrowView arrowViewWithFrame:arrowFrame arrowDirection:direction];
        [self addSubview:arrowView];
    }
    return self;
}

- (void)buildReasonViewWithFrame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5.0;
    for (NSInteger idx = 0; idx < self.itemTitles.count; idx++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = idx;
        button.backgroundColor    = [UIColor whiteColor];
        button.layer.cornerRadius = 4.0;
        button.layer.borderWidth  = 1.0;
        button.titleLabel.font    = [UIFont systemFontOfSize:10];
        button.bounds = CGRectMake(0, 0, KGDislikeViewItemWidth, KGDislikeViewItemHeight);
        button.center = CGPointMake(idx % 2 ? frame.size.width * 0.75 : frame.size.width * 0.25, (idx / 2) * (KGDislikeViewItemHeight + KGDislikeViewItemVerticalPadding) + KGDislikeViewHeaderHeight + (KGDislikeViewItemVerticalPadding + (KGDislikeViewItemHeight / 2.0)));
        [button setTitle:self.itemTitles[idx] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(onClickItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
    self.reasonView = view;
    [self addSubview:view];
}

- (void)onClickItemButton:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        button.layer.borderColor = [UIColor redColor].CGColor;
    } else {
        button.layer.borderColor = [UIColor blackColor].CGColor;
    }
}



@end
