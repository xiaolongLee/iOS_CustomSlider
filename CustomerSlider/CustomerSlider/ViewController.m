//
//  ViewController.m
//  CustomerSlider
//
//  Created by yuanshi on 2020/6/11.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "ViewController.h"
#import "NumberSlider.h"
#import "TipsView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NumberSlider *slider = [[NumberSlider alloc] init];
    slider.frame = CGRectMake(16, 200, [UIScreen mainScreen].bounds.size.width - 32, 30);
    [self.view addSubview:slider];
    slider.minimumValue = 0;
    slider.maximumValue = 998;

    [slider setValue:168 animated:YES];
   
}

 


@end
