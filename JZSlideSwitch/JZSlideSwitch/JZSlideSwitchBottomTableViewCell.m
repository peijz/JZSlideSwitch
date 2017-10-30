//
//  JZSlideSwitchBottomTableViewCell.m
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/27.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "JZSlideSwitchBottomTableViewCell.h"
#import "JZSlideSwitchBottomTableCell.h"
@interface JZSlideSwitchBottomTableViewCell()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView * jz_tableView;
@end
@implementation JZSlideSwitchBottomTableViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    UITableView * jz_tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    jz_tableView.delegate = self;
    jz_tableView.dataSource = self;
    jz_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview:jz_tableView];
    self.jz_tableView = jz_tableView;
    
}

#pragma mark - tableView 的数据源代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JZSlideSwitchBottomTableCell * cell = [JZSlideSwitchBottomTableCell cellWithTableView:tableView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat jz_tableViewX = 0;
    CGFloat jz_tableViewY = 0;
    CGFloat jz_tableViewW = self.bounds.size.width;
    CGFloat jz_tableViewH = self.bounds.size.height;
    self.jz_tableView.frame = CGRectMake(jz_tableViewX, jz_tableViewY, jz_tableViewW, jz_tableViewH);
}

@end
