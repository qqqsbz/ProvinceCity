//
//  HeaderView.h
//  ProvinceCity
//
//  Created by coder on 15/11/10.
//  Copyright © 2015年 coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIControl

@property (strong, nonatomic) UILabel       *textLabel;
@property (strong, nonatomic) UIImageView   *imageView;
@property (assign, nonatomic) CGFloat       leftPadding;
@property (assign, nonatomic) CGFloat       rightPadding;


- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image text:(NSString *)text;
@end
