//
//  UIImageView+DownLoadImage.m
//  Time_Space
//
//  Created by 庆玮陶 on 16/1/18.
//  Copyright © 2016年 CveniEs. All rights reserved.
//

#import "UIImageView+DownLoadImage.h"

#import "CveniEsWebImage.h"

@implementation UIImageView (DownLoadImage)

- (void)cvenies_setImageURLStr:(NSString *)str
{
    [self cvenies_setImageUrlStr:str placeHolderImage:nil];
}

- (void)cvenies_setImageUrlStr:(NSString *)str placeHolderImage:(UIImage *)image
{
    self.image = image;
    __weak UIImageView *imgView = self;
    [CveniEsWebImage downloadImageWithURLString:str result:^(UIImage *image, NSError *error) {
        if (error) {
            return ;
        }
        
        if (!image) {
            return;
        }
        
        imgView.image = image;
    }];
}

@end
