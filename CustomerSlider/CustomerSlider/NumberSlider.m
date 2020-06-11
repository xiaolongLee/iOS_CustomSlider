//
//  NumberSlider.m
//  CustomerSlider
//
//  Created by yuanshi on 2020/6/11.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "NumberSlider.h"
#import "TipsView.h"
@implementation NumberSlider
/**
 @param text 文字
 @param fontSize 字体大小
 @param size 图片大小
 @param textColor 文字颜色
 @param backgroundColor 背景颜色
 @param radius 圆角弧度
 @return 图片对象
 */

- (UIImage *)imageWithText:(NSString *)text
                  fontSize:(CGFloat)fontSize
                      size:(CGSize)size
                 textColor:(UIColor *)textColor
           backgroundColor:(UIColor *)backgroundColor
                    radius:(CGFloat)radius {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, textColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillRect(context, rect);
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    CGFloat yOffset = (rect.size.height - font.pointSize) / 2.0 - 1.25;
    CGRect textRect = CGRectMake(0, yOffset, rect.size.width, rect.size.height - yOffset);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [text drawInRect:textRect withAttributes:@{NSFontAttributeName: font,NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

- (void)setValue:(float)value animated:(BOOL)animated {
    [super setValue:value animated:animated];
    NSString *text = [NSString stringWithFormat:@"%.0f",value];
    UIImage *image = [self imageWithText:text fontSize:14 size:CGSizeMake(30, 30) textColor:[UIColor whiteColor] backgroundColor:[UIColor grayColor] radius:15];
    [self setThumbImage:image forState:UIControlStateNormal];
    float numerator = value - self.minimumValue;
    float denominator = self.maximumValue - self.minimumValue;
    CGFloat x = numerator / denominator;
    [[TipsView instance] showText:text targetView:self andX:(x * (self.bounds.size.width - 15*2) - 56/2 + 15)];
     
    
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [[TipsView instance] hide];

}

@end
