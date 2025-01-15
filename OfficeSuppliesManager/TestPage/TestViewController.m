//
//  TestViewController.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/8.
//

#import "TestViewController.h"
#import "MSKTabBarView.h"
#import "MSKPillTabBarView.h"

#import "Masonry.h"

@interface TestViewController ()
@property (nonatomic, strong) MSKPillTabBarView *tabView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIVisualEffectView *blurEffectView;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UILabel *helloLabel;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) BOOL isSecondTap; // 用于标记是否双击了第二下
@property (nonatomic, assign) CGPoint lastPanPoint; // 记录上次滑动的位置
@property (nonatomic, strong) dispatch_queue_t  queue;
@property (nonatomic, strong) NSString *name;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupUI];
    [self setupConstraints];
    [self setupGesture];
}

- (void)setupUI {
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.helloLabel];
    [self.contentView addSubview:self.collectionView];
    [self.view addSubview:self.blurEffectView];
    [self.view addSubview:self.tabView];

    
}
- (void)setupConstraints {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.blurEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.helloLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        make.left.equalTo(self.view.mas_left).offset(20);
    }];
    
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(120);
    }];
    
}
- (void)setupGesture {
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.view addGestureRecognizer:longPressGesture];
    
//    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
//    [self.view addGestureRecognizer:pinchGesture];
}

- (void)handleLongPress:(UIPinchGestureRecognizer *)gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.blurEffectView.hidden = NO;
        [UIView animateWithDuration:0.25 animations:^{
            self.contentView.transform = CGAffineTransformScale(self.contentView.transform, 0.99 ,0.99);
            self.blurEffectView.alpha = 0.9;
        }];

    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.4 animations:^{
            self.contentView.transform = CGAffineTransformIdentity;
            self.blurEffectView.alpha = 0;
        } completion:^(BOOL finished) {
            self.blurEffectView.hidden = YES;
        }];
    }
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}
- (MSKPillTabBarView *)tabView {
    if (!_tabView) {
        _tabView = [[MSKPillTabBarView alloc] init];
    }
    return _tabView;
}
- (UIVisualEffectView *)blurEffectView {
    if (!_blurEffectView) {
        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        _blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurEffectView.alpha = 0;
        _blurEffectView.hidden = YES;
        
    }
    return _blurEffectView;
}
- (UILabel *)helloLabel {
    if (!_helloLabel) {
        _helloLabel = UILabel.new;
        _helloLabel.font = [UIFont systemFontOfSize:18];
        _helloLabel.textColor = UIColor.blackColor;
        _helloLabel.text = @"你好，涂涂";
    }
    return _helloLabel;
}
@end
