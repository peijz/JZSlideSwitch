//
//  JZSlideSwitchBottomCell.m
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//
#define JZScreenWidth [UIScreen mainScreen].bounds.size.width
#define JZScreenHeight [UIScreen mainScreen].bounds.size.height
#import "JZSlideSwitchBottomCell.h"
#import "JZSlideSwitchBottomTableViewCell.h"

@interface JZSlideSwitchBottomCell()<UICollectionViewDelegate,UICollectionViewDataSource>
// collectionview
@property(nonatomic,weak)UICollectionView * jz_collectionView;
@property(nonatomic,copy)JZSlideSwitchBottomCellIndexBlock cellIndexBlock;
@end
@implementation JZSlideSwitchBottomCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString * IJZSlideSwitchBottomCell = @"JZSlideSwitchBottomCell";
    JZSlideSwitchBottomCell * cell = [tableView dequeueReusableCellWithIdentifier:IJZSlideSwitchBottomCell];
    if (cell == nil)
    {
        cell = [[JZSlideSwitchBottomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IJZSlideSwitchBottomCell];
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
    [jz_collectionView registerClass:[JZSlideSwitchBottomTableViewCell class] forCellWithReuseIdentifier:@"JZSlideSwitchBottomTableViewCell"];
    jz_collectionView.backgroundColor = [UIColor whiteColor];
    //    jz_collectionView.contentSize = CGSizeMake(JZScreenWidth, 0);
    //jz_collectionView.contentOffset = CGPointMake(_currentOffsetX, 0);
    jz_collectionView.pagingEnabled = YES;
    jz_collectionView.alwaysBounceVertical = NO;
    //jz_collectionView.contentSize = CGSizeMake(self.jz_datas.count*JZScreenWidth, JZScreenHeight);
    jz_collectionView.showsHorizontalScrollIndicator = NO;
    jz_collectionView.showsVerticalScrollIndicator = NO;
    jz_collectionView.dataSource = self;
    jz_collectionView.delegate = self;
    jz_collectionView.scrollEnabled = YES;
    [self addSubview:jz_collectionView];
    self.jz_collectionView = jz_collectionView;

}
#pragma mark - UIScrollview的代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //获得页码
    CGFloat doublePage=scrollView.contentOffset.x / self.jz_collectionView.bounds.size.width;
    int intPage=(doublePage+0.5);
    if (_cellIndexBlock) {
        _cellIndexBlock(intPage);
    }
}

#pragma mark -- UICollectionViewDataSource
/** 每组cell的个数*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JZSlideSwitchBottomTableViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZSlideSwitchBottomTableViewCell" forIndexPath:indexPath];
    
    
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}

-(void)selectedSlideSwitchBottomCellIndex:(JZSlideSwitchBottomCellIndexBlock)cellIndexBlock{
    _cellIndexBlock = cellIndexBlock;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    // collectionview
    CGFloat jz_collectionViewX = 0;
    CGFloat jz_collectionViewY = 0;
    CGFloat jz_collectionViewW = self.bounds.size.width;
    CGFloat jz_collectionViewH = self.bounds.size.height;
    self.jz_collectionView.frame = CGRectMake(jz_collectionViewX, jz_collectionViewY, jz_collectionViewW, jz_collectionViewH);
}

@end
