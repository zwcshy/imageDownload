//
//  ViewController.m
//  CveniEs_UIImageDownlaod
//
//  Created by 庆玮陶 on 16/2/22.
//  Copyright © 2016年 CveniEs. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+DownLoadImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *imageStr = @"http://img6.cache.netease.com/3g/2015/12/14/20151214075020e2c56.jpg";
    [self.imgView cvenies_setImageURLStr:imageStr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
