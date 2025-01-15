//
//  ViewController.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/3.
//

#import "ViewController.h"
#import "MSKTabBarView.h"

#import "MSKHomePageAssetsCollectionViewCell.h"
#import "Masonry.h"
@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) MSKTabBarView *tabView;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UILabel *helloLabel;
@property (nonatomic, strong) UIImageView *notificationIcon;
@property (nonatomic, strong) UIImageView *currentBalanceIcon;
@property (nonatomic, strong) UILabel *currentBalance;
@property (nonatomic, strong) UILabel *currentBalanceTitle;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xC8C8C8);
    [self setupUI];
    [self setupConstraints];
    
    
//TODO: need refactoring
    
    UIView *cardView = UIView.new;
    cardView.backgroundColor = UIColorFromRGB(0xF4FFF1);
    cardView.layer.cornerRadius = 40;
    cardView.layer.masksToBounds = YES;
    [self.view addSubview:cardView];
    
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.layer.cornerRadius = 40;
    [cardView addSubview:blurEffectView];
    
    [cardView addSubview:self.currentBalanceIcon];
    [cardView addSubview:self.currentBalanceTitle];
    [cardView addSubview:self.currentBalance];

    
    [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.helloLabel.mas_bottom).offset(16);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.mas_equalTo(120);
    }];
    [blurEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cardView);
    }];
    [self.currentBalanceIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cardView).offset(20);
        make.top.equalTo(cardView).offset(24);
        make.bottom.equalTo(cardView.mas_bottom).offset(-24);
        make.width.equalTo(self.currentBalanceIcon.mas_height);
    }];
    [self.currentBalanceTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentBalanceIcon.mas_right).offset(20);
        make.top.equalTo(self.currentBalanceIcon);
    }];
    [self.currentBalance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentBalanceIcon.mas_right).offset(20);
        make.bottom.equalTo(self.currentBalanceIcon.mas_bottom);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cardView.mas_bottom).offset(10);
            make.left.right.bottom.equalTo(self.view);
    }];
    
    
//TODO: end
    
    
}
- (void)setupUI {
    [self.view addSubview:self.helloLabel];
    [self.view addSubview:self.notificationIcon];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.tabView];

    
}
- (void)setupConstraints {
    [self.helloLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        make.left.equalTo(self.view.mas_left).offset(20);
    }];
    [self.notificationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
    
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(120);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20; // 总共 20 个 item
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MSKHomePageAssetsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    // 配置自定义 Cell
    cell.imageView.image = [UIImage imageNamed:@"profiloshow"]; // 替换为你的图片名称
    cell.titleLabel.text = [NSString stringWithFormat:@"Item %ld", (long)indexPath.item + 1];
        
        
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat totalSpacing = 10 * (2 - 1); // 两列的间距
    CGFloat width = (collectionView.frame.size.width - totalSpacing) / 2; // 每个 cell 的宽度
    return CGSizeMake(width, width + 30); // 高度多 30 用于显示标题
}

- (MSKTabBarView *)tabView {
    if (!_tabView) {
        _tabView = [[MSKTabBarView alloc] init];
    }
    return _tabView;
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
- (UILabel *)currentBalanceTitle{
    if (!_currentBalanceTitle) {
        _currentBalanceTitle = UILabel.new;
        _currentBalanceTitle.font = [UIFont systemFontOfSize:16];
        _currentBalanceTitle.textColor = UIColorFromRGB(0xf3f3f3);
        _currentBalanceTitle.text = @"当前余额";
    }
    return _currentBalanceTitle;
}
- (UILabel *)currentBalance {
    if (!_currentBalance) {
        _currentBalance = UILabel.new;
        _currentBalance.font = [UIFont boldSystemFontOfSize:36];
        _currentBalance.textColor = UIColor.blackColor;
        _currentBalance.text = @"4450";
    }
    return _currentBalance;
}

- (UIImageView *)notificationIcon {
    if (!_notificationIcon) {
        _notificationIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_message_button"]];
    }
    return _notificationIcon;
}

- (UIImageView *)currentBalanceIcon {
    if (!_currentBalanceIcon) {
        _currentBalanceIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_tab_avatar_bg"]];
    }
    return _currentBalanceIcon;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {

        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColorFromRGB(0xC8C8C8);
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[MSKHomePageAssetsCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        
    }
    return _collectionView;
}

@end
