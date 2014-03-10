//
//  FeedStoreViewController.m
//  Paper
//
//  Created by Matej Hrescak on 3/8/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "FeedStoreViewController.h"
#import "UIView+SimplePosition.h"
#import "CardView.h"

static const CGFloat kWobbleAngle = 2;
static const CGFloat kShowDropAreaThreshold = 500;
static const CGFloat kSnapDropAreaThreshold = 300;
static const CGPoint kCardOriginPoint = {160, 500};
static const CGFloat kCardScaleRatio = 1.1;

@interface FeedStoreViewController ()
@property (nonatomic, weak) IBOutlet CardView *facebookCard;
@property (nonatomic, weak) IBOutlet CardView *headlinesCard;
@property (nonatomic, weak) IBOutlet UIView *dropArea;
@property (nonatomic, strong) UILongPressGestureRecognizer *cardGestureRecognizer;
@property (nonatomic, assign) BOOL isDropAreaVisible;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UISnapBehavior *snapBehavior;
@property (nonatomic, strong) UIAttachmentBehavior *attachment;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;
@property (nonatomic, assign) CGSize touchOffset;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@end

@implementation FeedStoreViewController

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
    
    //let's do cards
    self.facebookCard = [[[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil] objectAtIndex:0];
    [self.facebookCard setTitle:@"Facebook"];
    self.facebookCard.center = CGPointMake(self.view.frame.size.width/2, 178);
    [self.view addSubview:self.facebookCard];
    
    self.headlinesCard = [[[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil] objectAtIndex:0];
    [self.headlinesCard setTitle:@"Headlines"];
    self.headlinesCard.center = kCardOriginPoint;
    [self.view addSubview:self.headlinesCard];

    // hide the droparea initially
    self.dropArea.alpha = 0;
    
    // set up gesturerecognizers
    self.cardGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(panHeadlines:)];
    self.cardGestureRecognizer.minimumPressDuration = 0;
    [self.headlinesCard addGestureRecognizer:self.cardGestureRecognizer];
    
    // set up dynamics
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravity = [[UIGravityBehavior alloc] init];
    [self.animator addBehavior:self.gravity];
    
    self.itemBehavior = [[UIDynamicItemBehavior alloc] init];
    self.itemBehavior.angularResistance = 5;
    [self.itemBehavior addItem:self.headlinesCard];
    [self.animator addBehavior:self.itemBehavior];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Making facebook card wobble
    [self.facebookCard startWobble];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - drop area

- (void)showDropArea{
    self.isDropAreaVisible = YES;
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.facebookCard.center = CGPointMake(-20, self.facebookCard.center.y);
        self.dropArea.alpha = 1;
    } completion:nil];
}
- (void)hideDropArea{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.facebookCard.center = CGPointMake(160, self.facebookCard.center.y);
        self.dropArea.alpha = 0;
    } completion:^(BOOL finished) {
        self.isDropAreaVisible = NO;
    }];
}

#pragma mark - snapping

- (void)snapToDropArea{
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.headlinesCard snapToPoint:self.dropArea.center];
    self.snapBehavior.damping = 0.7;
    [self.animator addBehavior:self.snapBehavior];
    [self.headlinesCard bounceToScale:1 completion:^(BOOL finished) {
        [self.headlinesCard startWobble];
    }];

}
- (void)snapToOrigin{
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.headlinesCard snapToPoint:kCardOriginPoint];
    self.snapBehavior.damping = 0.7;
    [self.animator addBehavior:self.snapBehavior];
    [self.headlinesCard bounceToScale:1 completion:^(BOOL finished) {
        [self hideDropArea];
    }];
}

#pragma mark - gestures

- (void)panHeadlines:(UILongPressGestureRecognizer *)recognizer
{
    CGPoint touch = [recognizer locationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self.animator removeBehavior:self.snapBehavior];
        [self.headlinesCard bounceToScale:kCardScaleRatio completion:nil];
        
        //calculate the offset of touch
        CGPoint cardTouch = [recognizer locationInView:self.headlinesCard];
        self.touchOffset = CGSizeMake(self.headlinesCard.frame.size.width/2 - cardTouch.x, self.headlinesCard.frame.size.height/2 - cardTouch.y);
        
        //create the attachment
        CGPoint offset = CGPointMake(cardTouch.x - self.headlinesCard.frame.size.width /2, cardTouch.y - self.headlinesCard.frame.size.height/2);
        self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.headlinesCard offsetFromCenter:UIOffsetMake(offset.x, offset.y) attachedToAnchor:touch];
        [self.animator addBehavior:self.attachment];
        
        [self.gravity addItem:self.headlinesCard];
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged){

        //self.headlinesCard.center = CGPointMake(touch.x + self.touchOffset.width, touch.y + self.touchOffset.height);
        self.attachment.anchorPoint = touch;
        
        if (touch.y < kShowDropAreaThreshold && !self.isDropAreaVisible) {
            [self showDropArea];
        }
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded){
        
        [self.animator removeBehavior:self.attachment];
        [self.gravity removeItem:self.headlinesCard];
        
        if (touch.y < kSnapDropAreaThreshold) {
            [self snapToDropArea];
        } else {
            [self snapToOrigin];
        }
    }
}

#pragma mark - closing the modal

- (IBAction)doneButtonTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
