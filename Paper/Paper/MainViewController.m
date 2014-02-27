//
//  MainViewController.m
//  Paper
//
//  Created by Matej Hrescak on 2/26/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "MainViewController.h"

static const CGFloat kPeekHeight = 40;
static const CGFloat kTension = .2;
static const CGFloat kFeedScaleTension = .2;
static const CGFloat kFeedOverflow = 100;
static const CGFloat kFeedCardWidth = 140;
static const CGFloat kFeedCardGutter = 4;
static const int kNumberOfCards = 10;

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *slideView;
@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
@property (strong, nonatomic) UIPanGestureRecognizer *slideViewGestureRecognizer;
@property (strong, nonatomic) UIPanGestureRecognizer *feedGestureRecognizer;
@property (nonatomic, assign) CGFloat slidePointOffset;
@property (nonatomic, assign) CGFloat slideOriginalY;
@property (nonatomic, assign) CGFloat feedPointY;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    self.slideViewGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSlideViewPanning:)];
    [self.slideView addGestureRecognizer:self.slideViewGestureRecognizer];
    
    self.feedGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleFeedPanning:)];
    self.feedGestureRecognizer.delegate = self;
    [self.feedScrollView addGestureRecognizer:self.feedGestureRecognizer];
    
    [self setUpFeed];
}

- (void)handleSlideViewPanning:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.slideOriginalY = self.slideView.center.y;
        self.slidePointOffset = point.y - self.slideOriginalY;
        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat targetY = point.y - self.slidePointOffset;
        
        if (self.slideView.frame.origin.y < 0) {
            targetY = self.slideOriginalY + (targetY - self.slideOriginalY) * kTension;
        }
        
        self.slideView.center = CGPointMake(self.slideView.center.x, targetY);
    
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    
        CGFloat targetY = self.view.frame.origin.y;
        
        if (velocity.y > 0) {
            targetY = self.view.frame.size.height - kPeekHeight;
        }

        [UIView animateWithDuration:.4 animations:^{
            CGRect targetFrame  = CGRectMake(self.slideView.frame.origin.x, targetY , self.slideView.frame.size.width, self.slideView.frame.size.height);
            self.slideView.frame = targetFrame;
        }];
    }
}

# pragma mark - Feed actions

- (void)setUpFeed {
    
    for (int i = 0; i < kNumberOfCards; i++) {
        UIView *feedItem = [[UIView alloc] initWithFrame:CGRectMake(i*(kFeedCardWidth + kFeedCardGutter), 0, kFeedCardWidth, self.feedScrollView.frame.size.height)];
        feedItem.backgroundColor = [UIColor whiteColor];
        [self.feedScrollView addSubview:feedItem];
    }
    self.feedScrollView.contentSize = CGSizeMake(kNumberOfCards * (kFeedCardWidth + kFeedCardGutter), self.feedScrollView.frame.size.height);
    
    // set up anchor point for scaling
    CGPoint topCenter = CGPointMake(CGRectGetMidX(self.feedScrollView.frame), CGRectGetMaxY(self.feedScrollView.frame));
    self.feedScrollView.layer.anchorPoint = CGPointMake(0.5, 1);
    self.feedScrollView.layer.position = topCenter;
    
    //set up bounds for when scaling down
    self.feedScrollView.bounds = CGRectMake(0, 0, self.feedScrollView.frame.size.width + kFeedOverflow * 2, self.feedScrollView.frame.size.height);
    self.feedScrollView.contentInset = UIEdgeInsetsMake(0, kFeedOverflow, 0, kFeedOverflow);
    self.feedScrollView.contentOffset = CGPointMake(-kFeedOverflow, 0);
}

- (void)handleFeedPanning:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.feedPointY = point.y;
        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat panDistance = point.y - self.feedPointY;
        CGFloat minDistance = 0;
        CGFloat maxDistance = -400;
        CGFloat initialScale = 1;
        CGFloat maxScale = 2.5;
        
        CGFloat targetScale = initialScale + (panDistance - minDistance) / (maxDistance - minDistance) * (maxScale - initialScale);
        
        if (targetScale < 1) {
            targetScale = initialScale + (targetScale - initialScale) * kFeedScaleTension;
        }
        self.feedScrollView.transform = CGAffineTransformMakeScale(targetScale, targetScale);
        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:.4 animations:^{
            self.feedScrollView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }

}

# pragma mark - Gesture recognizers

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if (gestureRecognizer == self.feedGestureRecognizer && otherGestureRecognizer != self.slideViewGestureRecognizer) {
        return YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
