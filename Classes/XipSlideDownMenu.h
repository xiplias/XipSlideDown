//
// Created by Anders Hansen on 05/02/14.
// Copyright (c) 2014 xip. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XipSlideDownMenu : UIViewController
@property (strong, nonatomic) UIViewController *topViewController;
@property (strong, nonatomic) UIViewController *mainViewController;


- (id)initWithMenuViewController:(UIViewController *)mainViewController topViewController:(UIViewController *)topViewController;

- (void)open:(BOOL)animated;
@end