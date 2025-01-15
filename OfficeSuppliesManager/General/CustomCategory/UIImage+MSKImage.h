//
//  UIImage+MSKImage.h
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MSKImage)

+ (UIImage *)imageWIthColor:(UIColor*)color size:(CGSize)size;

- (UIImage *)imageByResizingToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
