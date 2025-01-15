//
//  UIBezierPath+CreateTransfer.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/6.
//

#import "UIBezierPath+CreateTransfer.h"

@implementation UIBezierPath (CreateTransfer)

- (void)createUpTransferLineWithCenter1:(CGPoint)center1 Center2:(CGPoint)center2 radius:(CGFloat)radius alpha:(CGFloat)alpha{
    CGFloat h1 = radius * sin(2 * M_PI_2 / 3);// r*sin60
    CGFloat h2 = h1 * alpha;
    CGFloat dx = h2 / tan(M_PI_2/3);
    
    CGPoint controlPoint1 = CGPointMake( center1.x + (2*radius - dx), center1.y - h2);
    CGPoint controlPoint2 = CGPointMake( center2.x - (2*radius - dx), center2.y - h2);
    
    CGPoint endPoint1 = CGPointMake(center2.x - (self.currentPoint.x - center1.x) , self.currentPoint.y);
    
    [self addCurveToPoint:endPoint1 controlPoint1:controlPoint1 controlPoint2:controlPoint2];
}
- (void)createDownTransferLineWithCenter1:(CGPoint)center1 Center2:(CGPoint)center2 radius:(CGFloat)radius alpha:(CGFloat)alpha{
    CGFloat h1 = radius * sin(2 * M_PI_2 / 3);// r*sin60
    CGFloat h2 = h1 * alpha;
    CGFloat dx = h2 / tan(M_PI_2/3);
    
    CGPoint controlPoint1 = CGPointMake( center1.x + (2*radius - dx), center1.y + h2);
    CGPoint controlPoint2 = CGPointMake( center2.x - (2*radius - dx), center2.y + h2);
    
    CGPoint endPoint1 = CGPointMake(center1.x + (center2.x - self.currentPoint.x) , self.currentPoint.y);
    
    [self addCurveToPoint:endPoint1 controlPoint1:controlPoint2 controlPoint2:controlPoint1];
}
@end
