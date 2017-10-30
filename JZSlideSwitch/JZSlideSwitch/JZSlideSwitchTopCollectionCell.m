//
//  JZSlideSwitchTopCollectionCell.m
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "JZSlideSwitchTopCollectionCell.h"
@interface JZSlideSwitchTopCollectionCell()
@property(nonatomic,weak)UILabel * jz_titleText;
@end
@implementation JZSlideSwitchTopCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    self.contentView.backgroundColor = [UIColor greenColor];
    UILabel * jz_titleText = [[UILabel alloc]init];
    jz_titleText.text = @"哈哈";
    jz_titleText.font = [UIFont systemFontOfSize:18];
    jz_titleText.textColor = [UIColor blackColor];
    jz_titleText.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:jz_titleText];
    self.jz_titleText = jz_titleText;
}

-(void)setJz_selected:(NSString *)jz_selected{
    _jz_selected = jz_selected;
    if ([jz_selected isEqualToString:@"0"]) { // 0 表示已经选中
        self.jz_titleText.textColor = [UIColor redColor];
        self.jz_titleText.font = [UIFont systemFontOfSize:25];
    }else{ // 1表示未选中
        self.jz_titleText.textColor = [UIColor blackColor];
        self.jz_titleText.font = [UIFont systemFontOfSize:20];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat jz_titleTextX = 0;
    CGFloat jz_titleTextY = 0;
    CGFloat jz_titleTextW = self.bounds.size.width;
    CGFloat jz_titleTextH = self.bounds.size.height;
    self.jz_titleText.frame = CGRectMake(jz_titleTextX, jz_titleTextY, jz_titleTextW, jz_titleTextH);
}
@end
