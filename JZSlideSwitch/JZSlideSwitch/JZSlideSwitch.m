//
//  JZSlideSwitch.m
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define JZScreenWidth [UIScreen mainScreen].bounds.size.width
#define JZScreenHeight [UIScreen mainScreen].bounds.size.height
#import "JZSlideSwitch.h"
#import "JZSlideSwitchTopView.h"
#import "JZSlideSwitchBottomCell.h"
@interface JZSlideSwitch()<UITableViewDelegate,UITableViewDataSource>
// tableView
@property(nonatomic,weak)UITableView * jz_tableView;
// topView
@property(nonatomic,weak)JZSlideSwitchTopView *jz_slideSwitchTopView;
@end
@implementation JZSlideSwitch

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    //topView
    JZSlideSwitchTopView *jz_slideSwitchTopView = [[JZSlideSwitchTopView alloc]initWithFrame:CGRectZero];
    [jz_slideSwitchTopView slideSwitchtopViewClickBlock:^(NSInteger index) {
        
        NSLog(@"刷新了数据 topview index = %ld",index);
    }];
    [self addSubview:jz_slideSwitchTopView];
    self.jz_slideSwitchTopView = jz_slideSwitchTopView;
    
    
    UITableView * jz_tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {
        jz_tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        jz_tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        jz_tableView.scrollIndicatorInsets = jz_tableView.contentInset;
    }
    jz_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    jz_tableView.dataSource = self;
    jz_tableView.delegate = self;
    [self addSubview:jz_tableView];
    self.jz_tableView = jz_tableView;
}

#pragma mark - tableview的数据源代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JZSlideSwitchBottomCell * cell = [JZSlideSwitchBottomCell cellWithTableView:tableView];
    WS(weakSelf);
    [cell selectedSlideSwitchBottomCellIndex:^(NSInteger index) {
        weakSelf.jz_slideSwitchTopView.jz_num = index;
    }];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat jz_slideSwitchTopViewX = 0;
    CGFloat jz_slideSwitchTopViewY = 64;
    CGFloat jz_slideSwitchTopViewW = self.bounds.size.width;
    CGFloat jz_slideSwitchTopViewH = 45;
    self.jz_slideSwitchTopView.frame =CGRectMake(jz_slideSwitchTopViewX, jz_slideSwitchTopViewY, jz_slideSwitchTopViewW, jz_slideSwitchTopViewH);
    
    CGFloat jz_tableViewX = jz_slideSwitchTopViewX;
    CGFloat jz_tableViewY = CGRectGetMaxY(self.jz_slideSwitchTopView.frame);
    CGFloat jz_tableViewW = jz_slideSwitchTopViewW;
    CGFloat jz_tableViewH = self.bounds.size.height - jz_tableViewY;
    self.jz_tableView.frame = CGRectMake(jz_tableViewX, jz_tableViewY, jz_tableViewW, jz_tableViewH);
}

@end
