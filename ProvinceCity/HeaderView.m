//
//  HeaderView.m
//  ProvinceCity
//
//  Created by coder on 15/11/10.
//  Copyright © 2015年 coder. All rights reserved.
//
#define MAS_SHORTHAND

#import "HeaderView.h"
#import <Masonry/Masonry.h>
@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image text:(NSString *)text
{
    if (self = [super initWithFrame:frame]) {
        self.leftPadding = 15.f;
        self.rightPadding = 10.f;
        self.textLabel = [UILabel new];
        self.imageView = [UIImageView new];
        [self addSubview:self.textLabel];
        [self addSubview:self.imageView];
        
        self.textLabel.text = text;
        self.textLabel.textAlignment = NSTextAlignmentLeft;
        self.imageView.image = image;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.textLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(self.leftPadding);
    }];
    [self.imageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(- self.rightPadding);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
}

@end
