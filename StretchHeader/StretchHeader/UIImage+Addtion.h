//
//  UIImage+UIImageAddtions.h
//  PocketTianjin
//
//  Created by ifuninfo on 13-1-24.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Addtion)

/**
 设置图片缩放
 **/
- (UIImage *)imageWithscaledToSize:(CGSize)newSize;
- (UIImage *)thumbWithScale:(CGFloat)scale;
- (UIImage *)stretchableImageWithCapInsets:(UIEdgeInsets)capInsets;

/**
 渐变色图片
 **/
+ (UIImage *)drawGradientInRect:(CGSize)size withColors:(NSArray*)colors;


+ (UIImage *)radialGradientImage:(CGSize)size start:(float)start end:(float)end centre:(CGPoint)centre radius:(float)radius;

/**
 单色图片
 **/
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 截屏
 **/
+ (UIImage *)screenShot:(UIDeviceOrientation)orientation isOpaque:(BOOL)isOpaque view:(UIView *)view usePresentationLayer:(BOOL)usePresentationLayer;
//调整图片的方向
- (UIImage *)fixOrientation:(UIImage *)aImage;


@end
