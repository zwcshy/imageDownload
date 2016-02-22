//
//  CveniEsWebImage.m
//  Time_Space
//
//  Created by 庆玮陶 on 16/1/6.
//  Copyright © 2016年 CveniEs. All rights reserved.
//

#import "CveniEsWebImage.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation CveniEsWebImage

+ (instancetype)shareCveniEsWebImage
{
    static CveniEsWebImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = [[CveniEsWebImage alloc] init];
    });
    return image;
}

+ (void)downloadImageWithURLString:(NSString *)urlString result:(void (^)(UIImage *, NSError *))returnImage
{
    CveniEsWebImage *image = [CveniEsWebImage shareCveniEsWebImage];
    [image downloadIamgeWithURLString:urlString result:^(UIImage *image, NSError *error) {
        returnImage(image, error);
    }];
}

- (void)downloadIamgeWithURLString:(NSString *)urlString result:(void (^)(UIImage *, NSError *))returnImage
{
    NSURL *imageURL = [NSURL URLWithString:urlString];
    
    // 转换md5获取文件路径
    NSString *name = [self md5String:urlString];
    NSString *filePath = [[self caches] stringByAppendingPathComponent:name];
    NSData *imageData = [[NSData alloc] initWithContentsOfFile:filePath];
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        returnImage(image, nil);
        return;
    }
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"图片下载出错:%@",[error localizedDescription]);
            return;
        }
        
        UIImage *image = [[UIImage alloc] initWithData:data];
        if (!image) {
            NSLog(@"图片格式有问题");
            return;
        }
        
        [data writeToFile:filePath atomically:YES];
        @autoreleasepool {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [[UIImage alloc] initWithData:data];
                returnImage(image, error);
            });
        }
    }];
    [dataTask resume];
}

- (NSString *)caches
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

- (NSString *)md5String:(NSString *)str
{
    unsigned char result[16];
    
    CC_MD5(str.UTF8String, (unsigned int)strlen(str.UTF8String), result);
    NSMutableString *resultStr = [NSMutableString string];
    for (int i = 0; i < 16; i ++) {
        [resultStr appendFormat:@"%02x",result[i]];
    }
    
    return resultStr;
}

@end
