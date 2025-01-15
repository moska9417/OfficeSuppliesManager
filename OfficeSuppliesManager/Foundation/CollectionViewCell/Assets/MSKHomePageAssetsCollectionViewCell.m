//
//  MSKHomePageAssetsCollectionViewCell.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/8.
//

#import "MSKHomePageAssetsCollectionViewCell.h"
#import "Masonry.h"
@implementation MSKHomePageAssetsCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        [self setupView];
        [self setupConstraints];
    }
    return self;
}
- (void)setupView{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
}
- (void)setupConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(self.contentView.mas_width);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(5);
        make.left.right.bottom.equalTo(self.contentView);
    }];
}
- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel){
        _titleLabel = UILabel.new;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = UIColor.blackColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end
