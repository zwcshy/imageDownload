//
//  CveniEsWebImage.h
//  Time_Space
//
//  Created by 庆玮陶 on 16/1/6.
//  Copyright © 2016年 CveniEs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface CveniEsWebImage : NSObject

+ (void)downloadImageWithURLString:(NSString *)urlString result:(void(^)(UIImage *image, NSError *error))returnImage;
- (void)downloadIamgeWithURLString:(NSString *)urlString result:(void(^)(UIImage *image, NSError *error))returnImage;

@end
