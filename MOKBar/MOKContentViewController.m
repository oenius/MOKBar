//
//  YJDContentViewController.m
//  YiJieDai
//
//  Created by YURI_JOU on 15/10/23.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import "MOKContentViewController.h"

#import "UIViewController+BarExtra.h"

@interface MOKContentViewController ()
<
UINavigationBarDelegate
>

@property (nonatomic, strong)UINavigationBar *navigationBar;

@property (nonatomic, strong)UIViewController *controller;

@end

@implementation MOKContentViewController

- (instancetype)initWithController:(UIViewController *)controller;
{
  self = [super init];
  if (self)
  {
    self.controller = controller;
    
    UINavigationBar *bar = [[UINavigationBar alloc]initWithFrame:CGRectZero];
    bar.delegate = self;
    self.navigationBar = bar;
    
    [self.view addSubview:bar];
    [self mok_layoutNavigationBar:bar];
    [self mok_setAttributesBar];

    
    controller.parentContent = self;
    [self.view addSubview:controller.view];
    [self addChildViewController:controller];
    [self mok_layoutControllerView:controller.view];
    
  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated
{
  [self mok_setAttributesBar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self mok_setAttributesBar];
}

#pragma mark - private method
- (void)mok_layoutNavigationBar:(UINavigationBar *)bar
{
  bar.translatesAutoresizingMaskIntoConstraints = NO;
  NSArray *hcs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[bar]-(0)-|"
                                                         options:0
                                                         metrics:nil
                                                           views:NSDictionaryOfVariableBindings(bar)];
  NSArray *vcs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[bar(==64)]"
                                                         options:0
                                                         metrics:nil
                                                           views:NSDictionaryOfVariableBindings(bar)];
  [self.view addConstraints:hcs];
  [self.view addConstraints:vcs];
}

- (void)mok_layoutControllerView:(UIView *)view
{
  view.translatesAutoresizingMaskIntoConstraints = NO;
  NSArray *hcs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[view]-(0)-|"
                                                         options:0
                                                         metrics:nil
                                                           views:NSDictionaryOfVariableBindings(view)];
  NSArray *vcs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(64)-[view]-(0)-|"
                                                         options:0
                                                         metrics:nil
                                                           views:NSDictionaryOfVariableBindings(view)];
  [self.view addConstraints:hcs];
  [self.view addConstraints:vcs];
  
}

- (void) mok_setAttributesBar
{
  UINavigationBar *bar = self.navigationBar;
  bar.translucent = NO;
  bar.tintColor = self.controller.navigationController.navigationBar.tintColor;
  bar.barTintColor = self.controller.navigationController.navigationBar.barTintColor;
  NSString *title = self.title ? self.title : self.controller.title;
  title = title? title: @"";
  UINavigationItem *back = [[UINavigationItem alloc]initWithTitle:@""];
  back.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                           style:UIBarButtonItemStylePlain
                                                          target:self
                                                          action:@selector(handlePop)];
  
  UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:title];
  item.leftBarButtonItems = [self.controller.navigationItem.leftBarButtonItems copy];
  item.rightBarButtonItems = [self.controller.navigationItem.rightBarButtonItems copy];
  [bar setItems:@[back,item]];
  bar.titleTextAttributes = @{
                              NSForegroundColorAttributeName:[UIColor whiteColor],
                              };
  self.navigationBar = bar;
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
  [self.navigationController popViewControllerAnimated:YES];
  return YES;
}

- (void)handlePop
{
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
