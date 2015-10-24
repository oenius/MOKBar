//
//  UINavigationController+YJDBarExtra.m
//  YiJieDai
//
//  Created by YURI_JOU on 15/10/24.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import <objc/runtime.h>

#import "NSObject+Extra.h"
#import "UINavigationController+BarExtra.h"

#import "MOKContentViewController.h"

static const void *kIsShouldPushInsideBar = &kIsShouldPushInsideBar;

@implementation UINavigationController (BarExtra)
@dynamic isShouldPushInsideBar;

- (BOOL)isShouldPushInsideBar
{
  return objc_getAssociatedObject(self, kIsShouldPushInsideBar);
}

- (void)setIsShouldPushInsideBar:(BOOL)isShouldPushInsideBar
{
  objc_setAssociatedObject(self, kIsShouldPushInsideBar, @(isShouldPushInsideBar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load
{
  [self swizzleMethod:@selector(pushViewController:animated:)
           withMethod:@selector(yjd_pushViewController:animated:)];
  
  [self swizzleMethod:@selector(popViewControllerAnimated:)
           withMethod:@selector(yjd_popViewControllerAnimated:)];
}

- (void)yjd_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  if (viewController.parentContent) {
    [viewController.parentContent.navigationController yjd_pushViewController:viewController animated:YES ];
  }
  if (viewController.holdInsideBarWhenPush  || self.viewControllers.firstObject.holdInsideBarWhenPush ) {
    self.isShouldPushInsideBar = YES;
    self.interactivePopGestureRecognizer.delegate = self.viewControllers.firstObject;
  }
  if (self.isShouldPushInsideBar)
  {
    MOKContentViewController *content = [[MOKContentViewController alloc]
                                         initWithController:viewController];

    content.hidesBottomBarWhenPushed = viewController.hidesBottomBarWhenPushed;

    [self yjd_pushViewController:content animated:YES];
  }
  else
  {
    [self yjd_pushViewController:viewController animated:YES];
  }
}

- (nullable UIViewController *)yjd_popViewControllerAnimated:(BOOL)animated
{
  UIViewController *controller =  [self yjd_popViewControllerAnimated:animated];
  return controller;
}

@end
