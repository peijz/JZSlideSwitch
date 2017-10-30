//
//  JZSlideSwitchBottomTableCell.m
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/27.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "JZSlideSwitchBottomTableCell.h"
@interface JZSlideSwitchBottomTableCell()
@property(nonatomic,weak)UILabel * jz_titleText;
@property(nonatomic,weak)UIView * jz_line;
@end
@implementation JZSlideSwitchBottomTableCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString * IJZSlideSwitchBottomTableCell = @"JZSlideSwitchBottomTableCell";
    JZSlideSwitchBottomTableCell * cell = [tableView dequeueReusableCellWithIdentifier:IJZSlideSwitchBottomTableCell];
    if (cell == nil)
    {
        cell = [[JZSlideSwitchBottomTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IJZSlideSwitchBottomTableCell];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    UILabel * jz_titleText = [[UILabel alloc]init];
    jz_titleText.text = @"测试";
    jz_titleText.font = [UIFont systemFontOfSize:20];
    jz_titleText.textColor = [UIColor blackColor];
    [self.contentView addSubview:jz_titleText];
    self.jz_titleText = jz_titleText;
    
    UIView *jz_line = [[UIView alloc]init];
    jz_line.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:jz_line];
    self.jz_line = jz_line;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat jz_titleTextX = 10;
    CGFloat jz_titleTextY = 0;
    CGFloat jz_titleTextW = self.bounds.size.width - 2*jz_titleTextX;
    CGFloat jz_titleTextH = self.bounds.size.height-0.5;
    self.jz_titleText.frame = CGRectMake(jz_titleTextX, jz_titleTextY, jz_titleTextW, jz_titleTextH);
    
    
    CGFloat jz_lineX = 0;
    CGFloat jz_lineY = self.bounds.size.height - 0.5;
    CGFloat jz_lineW = self.bounds.size.width;
    CGFloat jz_lineH = 0.5;
    self.jz_line.frame = CGRectMake(jz_lineX, jz_lineY, jz_lineW, jz_lineH);
}

@end
