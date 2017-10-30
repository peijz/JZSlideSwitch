//
//  JZSlideSwitchBottomCell.h
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^JZSlideSwitchBottomCellIndexBlock)(NSInteger index);
@interface JZSlideSwitchBottomCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
-(void)selectedSlideSwitchBottomCellIndex:(JZSlideSwitchBottomCellIndexBlock)cellIndexBlock;
@end
