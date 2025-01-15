//
//  MSKPillTabBarView.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/8.
//

#import "MSKPillTabBarView.h"

#import "Masonry.h"
@interface MSKPillTabBarView ()

@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIView *selectedView;

@property (nonatomic, strong) UIVisualEffectView *blurEffectView;


@end

@implementation MSKPillTabBarView
- (instancetype)init {
    if (self = [super init]){
        self.backgroundColor = UIColor.clearColor;
        [self setupUI];
        [self setupConstraints];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.blurEffectView];
    
    [self addSubview:self.selectedView];
    [self addSubview:self.rightButton];
    [self addSubview:self.leftButton];

}

- (void)setupConstraints {
    [self.selectedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.leftButton);
    }];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(48);
        make.width.mas_equalTo(96);
        make.centerY.equalTo(self);
        make.right.mas_equalTo(self.mas_centerX).offset(-5);
    }];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(48);
        make.width.mas_equalTo(96);
        make.centerY.equalTo(self);
        make.left.mas_equalTo(self.mas_centerX).offset(5);
    }];
    [self.blurEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(48+8);
        make.left.equalTo(self.leftButton.mas_left).offset(-4);
        make.right.equalTo(self.rightButton.mas_right).offset(4);
        make.center.equalTo(self);
    }];
   
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)onLeftButtonClick:(UIButton *)sender {
    [UIView animateWithDuration:0.4 animations:^{
        self.selectedView.frame = self.leftButton.frame; // 将视图移动到新的位置
    } completion:^(BOOL finished) {
        [self.selectedView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.leftButton);
            [self layoutIfNeeded];
        }];
    }];
}

- (void)onRightButtonClick:(UIButton *)sender {
    [UIView animateWithDuration:0.4 animations:^{
        self.selectedView.frame = self.rightButton.frame; // 将视图移动到新的位置
    } completion:^(BOOL finished) {
        [self.selectedView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.rightButton);
            [self layoutIfNeeded];
        }];
    }];
}

- (void)onButtonClick:(UIButton *)sender {
    // 创建震动反馈
    UIImpactFeedbackGenerator *feedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    [feedbackGenerator prepare]; // 提前准备以减少延迟
    [feedbackGenerator impactOccurred]; // 触发震动反馈
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
- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = UIButton.new;
        _leftButton.backgroundColor = UIColor.clearColor;
        _leftButton.layer.cornerRadius = 24;
        [_leftButton setTitle:@"入库" forState:UIControlStateNormal];
        [_leftButton setTitleColor:UIColorFromRGB(0xfcfcfc) forState:UIControlStateHighlighted];
        [_leftButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];

        [_leftButton addTarget:self action:@selector(onLeftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = UIButton.new;
        _rightButton.backgroundColor = UIColor.clearColor;
        _rightButton.layer.cornerRadius = 24;
        [_rightButton setTitle:@"出库" forState:UIControlStateNormal];
        [_rightButton setTitleColor:UIColorFromRGB(0xfcfcfc) forState:UIControlStateHighlighted];
        [_rightButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        
        [_rightButton addTarget:self action:@selector(onRightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _rightButton;
}
- (UIVisualEffectView *)blurEffectView {
    if (!_blurEffectView) {
        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        _blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurEffectView.layer.cornerRadius = 28;
        _blurEffectView.layer.masksToBounds = YES;
        
    }
    return _blurEffectView;
}
- (UIView *)selectedView {
    if (!_selectedView) {
        _selectedView = [[UIView alloc] init];
        _selectedView.backgroundColor = UIColorFromRGB(0xEAFC5F);
        _selectedView.layer.cornerRadius = 24;
        _selectedView.layer.masksToBounds = YES;
    }
    return _selectedView;
}

@end
