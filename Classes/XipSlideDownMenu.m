//
// Created by Anders Hansen on 05/02/14.
// Copyright (c) 2014 xip. All rights reserved.
//

#import "XipSlideDownMenu.h"

@interface XipSlideDownMenu ()

@property (nonatomic, strong) UIView *containerView;

@end


@implementation XipSlideDownMenu

- (id)initWithMenuViewController:(UIViewController *)mainViewController topViewController:(UIViewController *)topViewController
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.mainViewController = mainViewController;
        self.topViewController = topViewController;

        [self setup];
    }
    return self;
}

- (void)setup {
    [self addViewController:self.mainViewController];
    [self addViewController:self.topViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addChildViewController:self.mainViewController];
    self.containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    self.mainViewController.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.mainViewController.view];
    [self.view addSubview:self.containerView];
    [self.mainViewController didMoveToParentViewController:self];

    [self addChildViewController:self.topViewController];
    [self.view insertSubview:self.topViewController.view aboveSubview:self.containerView];
    [self.topViewController didMoveToParentViewController:self];
}

- (void)addViewController:(UIViewController *)viewController {
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
}

- (void) open:(BOOL)animated {
    //Place the top hidden controller
    CGRect currentTopFrame  = self.topViewController.view.frame;
    currentTopFrame.origin  = CGPointMake(0.0f, (-1 * self.topViewController.view.frame.size.height));
    self.topViewController.view.frame   = currentTopFrame;

    CGRect frame                = self.view.frame;
    frame.origin.y              = 300;

    [UIView animateWithDuration:0.3f delay:0 options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAllowAnimatedContent) animations:^{
        self.view.frame = frame;
    } completion:^(BOOL finished) {

    }];

//    [UIView animateWithDuration:(animated) ? 0.3f : 0
//         animations:^{
//
//
//         } completion:^(BOOL finished) {
//
//         }
//
//    ];
}


@end