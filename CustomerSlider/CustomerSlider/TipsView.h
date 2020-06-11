//
//  TipsView.h
//  CustomerSlider
//
//  Created by yuanshi on 2020/6/11.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TipsView : UIView

+ (instancetype)instance;

- (void)showText:(NSString *)text targetView:(UIView *)targetView andX:(CGFloat)x;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
