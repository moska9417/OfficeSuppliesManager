//
//  UIImage+MSKImage.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/15.
//

#import "UIImage+MSKImage.h"

@implementation UIImage (MSKImage)

+(UIImage *)imageWIthColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsImageRendererFormat *format = [UIGraphicsImageRendererFormat defaultFormat];
    format.scale = .0;
    format.opaque = NO;
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize:size format:format];
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        CGContextRef context = rendererContext.CGContext;
        [color set];
        CGContextFillRect(context, CGRectMake(.0, .0, size.width, size.height));
    }];
    return image;
}

- (UIImage *)imageByResizingToSize:(CGSize)size {
    UIGraphicsImageRendererFormat *format = [UIGraphicsImageRendererFormat defaultFormat];
    format.scale = 0;
    format.opaque = NO;
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize:size format:format];
    MSKWeakSelf(self)
    UIImage *result = [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        [weakself drawInRect:CGRectMake(.0, .0, size.width, size.height)];
    }];
    return result;
}
@end
