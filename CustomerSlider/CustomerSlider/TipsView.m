//
//  TipsView.m
//  CustomerSlider
//
//  Created by yuanshi on 2020/6/11.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "TipsView.h"

static NSTimer *countTimer;
static int changeCount = -1;

@implementation TipsView

static UILabel *label;

+ (instancetype)instance {
    return [[self alloc] init];
}

- (instancetype)init {
    static TipsView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super init];
        self.autoresizesSubviews = YES;
        self.frame = CGRectMake(0, 0, 56, 44);
        UIImage *image = [UIImage imageNamed:@"播放视频-进度条 (1).png"];
        self.layer.contents = (id)image.CGImage;
//        instance.backgroundColor = [UIColor orangeColor];
        label = [[UILabel alloc] init];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.frame = CGRectMake(0, 0, 56, 35);
        label.textColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20.0];
        label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:label];
        
        countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
        countTimer.fireDate = [NSDate distantFuture];
        
        
        
    });
    
    return instance;
}

- (void)showText:(NSString *)text targetView:(UIView *)targetView andX:(CGFloat)x {
    label.text = text;
   
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect targetFrame = [targetView convertRect:targetView.bounds toView:window];
    self.frame = CGRectMake(targetFrame.origin.x + x, targetFrame.origin.y - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    countTimer.fireDate = [NSDate distantPast];
    changeCount = 1.0;
    
    
    
}

- (void)hide {
    countTimer.fireDate = [NSDate distantFuture];
    [self removeFromSuperview];
}

- (void)changeTime {
    if (changeCount-- <= 0) {
        countTimer.fireDate = [NSDate distantFuture];
        [self removeFromSuperview];
    }
}

@end
