//
//  StarMainCollectionViewCell.m
//  StarCloset
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "StarMainCollectionViewCell.h"

@interface StarMainCollectionViewCell ()



@end


@implementation StarMainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (UIView * view in self.contentView.subviews) {
            [view removeFromSuperview];
        }
        [self setViewWithModel:_model];
    }
    return self;
}

//给自定义控件赋值
- (void)setViewWithModel:(StarMainClassificationModel*)model
{
//    商品图片
    UIImageView * godImageView = [[UIImageView alloc]init];
    godImageView.frame = CGRectMake(0, 0, model.needW, 300);
    NSString * imageURL = [[model.model.picUrl componentsSeparatedByString:@"?"] firstObject];
    [godImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    [self.contentView addSubview:godImageView];
//    国旗图标
    UIImageView * countryImageView = [[UIImageView alloc]init];
    
    [countryImageView sd_setImageWithURL:[NSURL URLWithString:model.model.nationalFlag]];
    [self.contentView addSubview:countryImageView];
    countryImageView.sd_layout.topSpaceToView(godImageView,5).leftSpaceToView(self.contentView,10).widthIs(15).heightIs(15);
//    国家名字
    UILabel * countryNameLabel = [[UILabel alloc]init];
    countryNameLabel.text = model.model.country;
    [self.contentView addSubview:countryNameLabel];
    countryNameLabel.sd_layout.topEqualToView(countryImageView).leftSpaceToView(countryImageView,0).rightSpaceToView(self.contentView,10).bottomEqualToView(countryImageView);
    
//    商品标题
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.text = model.model.Description;
    [self.contentView addSubview:titleLabel];
    titleLabel.sd_layout.topSpaceToView(countryImageView,6).leftEqualToView(countryImageView).rightSpaceToView(self.contentView,10).heightIs(20);
    
//    商品价格
    UILabel * priceLabel = [[UILabel alloc]init];
    priceLabel.text = [NSString stringWithFormat:@"￥%@",model.model.price];
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:priceLabel];
    priceLabel.sd_layout.topSpaceToView(titleLabel,0).leftEqualToView(titleLabel).rightEqualToView(titleLabel).heightIs(30);
}


@end
