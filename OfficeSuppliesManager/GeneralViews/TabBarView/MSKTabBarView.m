//
//  MSKTabBarView.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/3.
//

#import "MSKTabBarView.h"
#import "Masonry.h"
#import "math.h"

#import "UIBezierPath+CreateTransfer.h"
@interface MSKTabBarView ()

@property (nonatomic, strong) UIButton* mainButton;
@property (nonatomic, strong) UIButton* middleButton;
@property (nonatomic, strong) UIButton* analysisButton;

@property (nonatomic, strong) UIVisualEffectView *blurEffectView;


@end

@implementation MSKTabBarView
- (instancetype)init {
    if (self = [super init]){
        self.backgroundColor = UIColor.clearColor;
        [self setupUI];
        [self setupConstraints];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.mainButton];
    [self addSubview:self.middleButton];
    [self addSubview:self.analysisButton];
}

- (void)setupConstraints {
    [self.middleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(60);
        make.centerY.equalTo(self);
        make.left.mas_equalTo(self.mas_centerX).offset(20);

    }];
    [self.mainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(60);
        make.centerY.equalTo(self);
        make.right.mas_equalTo(self.mas_centerX).offset(-20);

    }];
//    [self.analysisButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.width.mas_equalTo(60);
//        make.centerY.equalTo(self);
//        make.left.equalTo(self.middleButton.mas_right).offset(10);
//    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self drawBG]; // 在布局完成后调用 drawBG
}
- (void)drawBG {
    // 获取按钮的中心和半径

    if (self.blurEffectView) {
        [self.blurEffectView removeFromSuperview];
        self.blurEffectView = nil;
    }
    CGPoint center1 = self.mainButton.center;
    CGPoint center2 = self.middleButton.center;
    CGPoint center3 = self.analysisButton.center;
    CGFloat radius = self.middleButton.frame.size.width / 2 +  8;

    // 贝塞尔曲线路径
    UIBezierPath *path = [UIBezierPath bezierPath];

    // 起点 - 第一个按钮顶部
    CGPoint startPoint = CGPointMake(center1.x, center1.y - radius);
    [path moveToPoint:startPoint];

    // 控制点和终点计算
    [path addArcWithCenter:center1 radius:radius startAngle:-M_PI_2 endAngle:-(2 *M_PI_2 / 3) clockwise:YES];
    
    [path createUpTransferLineWithCenter1:center1 Center2:center2 radius:radius alpha:0.8];
    
//    [path addArcWithCenter:center2 radius:radius startAngle:-(4 * M_PI_2 / 3) endAngle:-(2 * M_PI_2/ 3) clockwise:YES];
//    
//    [path createUpTransferLineWithCenter1:center2 Center2:center3 radius:radius alpha:0.8];
//    
    [path addArcWithCenter:center2 radius:radius startAngle:-(4 * M_PI_2 / 3) endAngle:(4 * M_PI_2/ 3) clockwise:YES];

//    [path createDownTransferLineWithCenter1:center2 Center2:center3 radius:radius alpha:0.8];
//    
//    [path addArcWithCenter:center2 radius:radius startAngle:(2 * M_PI_2 / 3) endAngle:(4 * M_PI_2/ 3) clockwise:YES];

    [path createDownTransferLineWithCenter1:center1 Center2:center2 radius:radius alpha:0.8];
    
    [path addArcWithCenter:center1 radius:radius startAngle:(2* M_PI_2/ 3) endAngle:-M_PI_2 clockwise:YES];
    
    // 关闭路径
    [path closePath];
    
   
    
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    self.blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.blurEffectView.frame = self.bounds;
    
    // 创建ShapeLayer并渲染
    CAShapeLayer *shapeLayer= [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.blurEffectView.layer.mask = shapeLayer;
    [self insertSubview:self.blurEffectView atIndex:0];
}

- (void)onMiddleButtonClick2:(UIButton *)sender {
    CGPoint center2 = self.middleButton.center;
    CGFloat radius = self.middleButton.frame.size.width / 2 +  8;
    UIBezierPath *endPath = [UIBezierPath bezierPath];
   [endPath addArcWithCenter:center2 radius:radius startAngle:-M_PI endAngle:M_PI clockwise:YES];
   [endPath closePath];

    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = (__bridge id _Nullable)(self.blurEffectView.layer.mask.shadowPath);
    pathAnimation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    pathAnimation.duration = 0.5;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    
    CAShapeLayer *shapeLayer= [CAShapeLayer layer];
    
    shapeLayer.path = endPath.CGPath;
    self.blurEffectView.layer.mask = shapeLayer;


    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.analysisButton.alpha = 0;
        self.mainButton.alpha = 0;
        self.blurEffectView.layer.mask = shapeLayer;
    }
                     completion:^(BOOL finished){
        
    }];

}

// 通用按钮点击事件，提供震动反馈
- (void)onMainButtonClick:(UIButton *)sender {
    _mainButton.backgroundColor = UIColorFromRGB(0xEAFC5F);
    _middleButton.backgroundColor = UIColorFromRGB(0xffffff);
    _analysisButton.backgroundColor = UIColorFromRGB(0xffffff);

}
- (void)onMiddleButtonClick:(UIButton *)sender {
    _mainButton.backgroundColor = UIColorFromRGB(0xffffff);
    _middleButton.backgroundColor = UIColorFromRGB(0xEAFC5F);
    _analysisButton.backgroundColor = UIColorFromRGB(0xffffff);
}
- (void)onAnalysisButtonClick:(UIButton *)sender {
    _mainButton.backgroundColor = UIColorFromRGB(0xffffff);
    _middleButton.backgroundColor = UIColorFromRGB(0xffffff);
    _analysisButton.backgroundColor = UIColorFromRGB(0xEAFC5F);
}

- (void)onButtonClick:(UIButton *)sender {
    // 创建震动反馈
    UIImpactFeedbackGenerator *feedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    [feedbackGenerator prepare]; // 提前准备以减少延迟
    [feedbackGenerator impactOccurred]; // 触发震动反馈

    // 自定义操作，例如：
    if (sender == self.mainButton) {
        NSLog(@"Main Button clicked");
    } else if (sender == self.middleButton) {
        NSLog(@"Middle Button clicked");
    } else if (sender == self.analysisButton) {
        NSLog(@"Analysis Button clicked");
    }
}

- (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    [color setFill];
    UIRectFill(rect);
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIButton *)mainButton {
    if (!_mainButton) {
        _mainButton = UIButton.new;
//        _mainButton.backgroundColor = UIColorFromRGB(0x212121);
        _mainButton.backgroundColor = UIColorFromRGB(0xffffff);
        _mainButton.layer.cornerRadius = 30;
        [_mainButton addTarget:self action:@selector(onMainButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        [_mainButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mainButton;
}

- (UIButton *)middleButton {
    if (!_middleButton) {
        _middleButton = UIButton.new;
        _middleButton.backgroundColor = UIColorFromRGB(0xEAFC5F);
        _middleButton.layer.cornerRadius = 30;
        [_middleButton addTarget:self action:@selector(onMiddleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_middleButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _middleButton;
}

- (UIButton *)analysisButton {
    if (!_analysisButton) {
        _analysisButton = UIButton.new;
        _analysisButton.backgroundColor = UIColorFromRGB(0xffffff);
        _analysisButton.layer.cornerRadius = 30;
        [_analysisButton addTarget:self action:@selector(onAnalysisButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_analysisButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _analysisButton;
}

@end
