//
//  JZSlideSwitchTopCell.m
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//
#define JZScreenWidth [UIScreen mainScreen].bounds.size.width
#define JZScreenHeight [UIScreen mainScreen].bounds.size.height
#import "JZSlideSwitchTopView.h"
#import "JZSlideSwitchTopCollectionCell.h"
@interface JZSlideSwitchTopView()<UICollectionViewDelegate,UICollectionViewDataSource>
// collectionview
@property(nonatomic,weak)UICollectionView * jz_collectionView;
@property(nonatomic,strong) NSMutableArray * jz_selectedDatas;
@property(nonatomic,copy) JZSlideSwitchTopViewClickBlock clickBlock;
// 线
@property(nonatomic,weak)UIView * jz_line;
@end
@implementation JZSlideSwitchTopView{
    int _jz_scrollNum;
}
-(NSMutableArray *)jz_selectedDatas{
    if (_jz_selectedDatas == nil) {
        _jz_selectedDatas = [[NSMutableArray alloc]init];
        for (int i = 0; i<15; i++) {
            if (i == 0) {
                [_jz_selectedDatas addObject:@"0"];
            }else{
                [_jz_selectedDatas addObject:@"1"];
            }
        }
    }
    return _jz_selectedDatas;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    // collectionview
    [self setupCollectionView];
    _jz_scrollNum = 0;
    // 线
    UIView * jz_line = [[UIView alloc]init];
    jz_line.backgroundColor = [UIColor redColor];
    [self addSubview:jz_line];
    self.jz_line = jz_line;

}

#pragma mark - 设置UICollectionview
-(void)setupCollectionView{
    // 滚动视图
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0.0;
    flowLayout.minimumLineSpacing      = 0.0;
    //设置单元格的尺寸
    flowLayout.itemSize = CGSizeMake(JZScreenWidth, JZScreenHeight);
    //设置头视图高度
    //    flowLayout.headerReferenceSize = CGSizeMake(0, 30);
    //flowlaout的属性，横向滑动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView * jz_collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    jz_collectionView.bounces = YES;
    [jz_collectionView registerClass:[JZSlideSwitchTopCollectionCell class] forCellWithReuseIdentifier:@"JZSlideSwitchTopCollectionCell"];
    jz_collectionView.backgroundColor = [UIColor whiteColor];
    jz_collectionView.alwaysBounceVertical = NO;
    jz_collectionView.showsHorizontalScrollIndicator = NO;
    jz_collectionView.showsVerticalScrollIndicator = NO;
    jz_collectionView.dataSource = self;
    jz_collectionView.delegate = self;
    jz_collectionView.scrollEnabled = YES;
    [self addSubview:jz_collectionView];
    self.jz_collectionView = jz_collectionView;
    
}
// 滚动方法
-(void)begingScrollAction{
    if (_jz_scrollNum>JZScreenWidth/200) {
        if (_jz_scrollNum == 14) {
            self.jz_collectionView.contentOffset = CGPointMake((_jz_scrollNum-JZScreenWidth/200-1)*100, 0);
        }else{
            CGFloat jz_collectionViewX = (_jz_scrollNum-JZScreenWidth/200)*100;
            CGFloat jz_collectionViewY = 0;
            self.jz_collectionView.contentOffset = CGPointMake(jz_collectionViewX, jz_collectionViewY);
        }
    }else{
        self.jz_collectionView.contentOffset = CGPointMake(0, 0);
    }
}


#pragma mark -- UICollectionViewDataSource
/** 每组cell的个数*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
    
}

/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JZSlideSwitchTopCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZSlideSwitchTopCollectionCell" forIndexPath:indexPath];
    cell.jz_selected = self.jz_selectedDatas[indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for (int i = 0; i<self.jz_selectedDatas.count; i++) {
        if (i == indexPath.row) {
            [self.jz_selectedDatas replaceObjectAtIndex:i withObject:@"0"];
        }else{
            [self.jz_selectedDatas replaceObjectAtIndex:i withObject:@"1"];
        }
    }
    if (_clickBlock) {
        _clickBlock(indexPath.row);
    }
    [collectionView reloadData];
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, self.frame.size.height);
}

-(void)slideSwitchtopViewClickBlock:(JZSlideSwitchTopViewClickBlock)clickBlock{
    _clickBlock = clickBlock;
}

-(void)setJz_num:(NSInteger)jz_num{
    _jz_num = jz_num;
    for (int i = 0; i<self.jz_selectedDatas.count; i++) {
        if (i == jz_num) {
            _jz_scrollNum = i;
            [self.jz_selectedDatas replaceObjectAtIndex:i withObject:@"0"];
        }else{
            [self.jz_selectedDatas replaceObjectAtIndex:i withObject:@"1"];
        }
    }
    if (_jz_scrollNum>=0) {
        [self begingScrollAction];
    }
    // 主要判断不要越界  后期补上
    [self.jz_collectionView reloadData];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    // collectionview
    CGFloat jz_collectionViewX = 0;
    CGFloat jz_collectionViewY = 0;
    CGFloat jz_collectionViewW = self.bounds.size.width;
    CGFloat jz_collectionViewH = self.bounds.size.height - 0.5;
    self.jz_collectionView.frame = CGRectMake(jz_collectionViewX, jz_collectionViewY, jz_collectionViewW, jz_collectionViewH);
    
    // 线
    CGFloat jz_lineX = jz_collectionViewX;
    CGFloat jz_lineY = jz_collectionViewH;
    CGFloat jz_lineW = jz_collectionViewW;
    CGFloat jz_lineH = 0.5;
    self.jz_line.frame = CGRectMake(jz_lineX, jz_lineY, jz_lineW, jz_lineH);
}

@end
