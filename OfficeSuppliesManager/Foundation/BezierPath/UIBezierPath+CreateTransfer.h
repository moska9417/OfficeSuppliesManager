//
//  UIBezierPath+CreateTransfer.h
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (CreateTransfer)
- (void)createUpTransferLineWithCenter1:(CGPoint)center1 Center2:(CGPoint)center2 radius:(CGFloat)radius alpha:(CGFloat)alpha;
- (void)createDownTransferLineWithCenter1:(CGPoint)center1 Center2:(CGPoint)center2 radius:(CGFloat)radius alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
