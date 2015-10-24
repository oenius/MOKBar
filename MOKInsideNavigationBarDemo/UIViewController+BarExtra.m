//
//  UIViewController+YJDBarExtra.m
//  YiJieDai
//
//  Created by YURI_JOU on 15/10/24.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import "UIViewController+BarExtra.h"
#import <objc/runtime.h>

static const void *kHoldInsideBarWhenPush = &kHoldInsideBarWhenPush;
static const void *kParentContent = &kParentContent;

@implementation UIViewController (BarExtra)

@dynamic holdInsideBarWhenPush;

- (BOOL)holdInsideBarWhenPush
{
  return [objc_getAssociatedObject(self, kHoldInsideBarWhenPush) boolValue];
}

- (void)setHoldInsideBarWhenPush:(BOOL)holdInsideBarWhenPush
{
  objc_setAssociatedObject(self, kHoldInsideBarWhenPush, @(holdInsideBarWhenPush), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewController *)parentContent
{
  return objc_getAssociatedObject(self, kParentContent);
}

- (void)setParentContent:(UIViewController *)parentContent
{
  objc_setAssociatedObject(self, kParentContent, parentContent, OBJC_ASSOCIATION_RETAIN);
}

@end
