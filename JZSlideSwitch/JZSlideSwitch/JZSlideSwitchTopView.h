//
//  JZSlideSwitchTopCell.h
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^JZSlideSwitchTopViewClickBlock)(NSInteger index);
@interface JZSlideSwitchTopView : UIView
-(void)slideSwitchtopViewClickBlock:(JZSlideSwitchTopViewClickBlock)clickBlock;
@property(nonatomic,assign) NSInteger jz_num;
@end
