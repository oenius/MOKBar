//
//  ViewController.m
//  MOKInsideNavigationBarDemo
//
//  Created by YURI_JOU on 15/10/24.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import "ViewController.h"
#import "MOKBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.navigationController setNavigationBarHidden:YES];
  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  self.holdInsideBarWhenPush = YES;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
