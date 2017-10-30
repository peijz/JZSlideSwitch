//
//  ViewController.m
//  JZSlideSwitch
//
//  Created by wanhongios on 2017/10/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "ViewController.h"
#import "JZSlideSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    self.title = @"JZSlideSwitch";
    
    JZSlideSwitch * slideSwitch = [[JZSlideSwitch alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:slideSwitch];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
