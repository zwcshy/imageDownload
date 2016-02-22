//
//  UIImageView+DownLoadImage.h
//  Time_Space
//
//  Created by 庆玮陶 on 16/1/18.
//  Copyright © 2016年 CveniEs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DownLoadImage)

- (void)cvenies_setImageURLStr:(NSString *)str;
- (void)cvenies_setImageUrlStr:(NSString *)str placeHolderImage:(UIImage *)image;

@end
