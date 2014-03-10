//
//  CardView.m
//  Paper
//
//  Created by Matej Hrescak on 3/10/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "CardView.h"

static const CGFloat kWobbleAngle = 2;
static const CGFloat kWobbleDisplacement = 10;

@interface CardView()
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UILabel *cardTitleLabel;
@end

@implementation CardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:(NSCoder *)aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    // do some setup
}

- (void)setTitle:(NSString *)title
{
    self.cardTitleLabel.text = title;
}

- (void)startWobble
{
    //initially animate to - x
    [UIView animateWithDuration:0.75 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction animations:^{
        CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI/180 * -kWobbleAngle);
//        CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -kWobbleDisplacement);
//        self.contentView.transform = CGAffineTransformConcat(rotation, translation);
        self.contentView.transform = rotation;
        
    } completion:^(BOOL finished) {
        // after that's done, animate all the time
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction animations:^{
            CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI/180 * kWobbleAngle);
//            CGAffineTransform translation = CGAffineTransformMakeTranslation(0, kWobbleDisplacement);
//            self.contentView.transform = CGAffineTransformConcat(rotation, translation);
            self.contentView.transform = rotation;
        } completion:nil];
    }];
}

- (void)bounceToScale:(CGFloat)scale completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        self.contentView.transform = CGAffineTransformMakeScale(scale, scale);
    } completion:completion];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
