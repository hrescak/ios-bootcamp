//
//  CardView.h
//  Paper
//
//  Created by Matej Hrescak on 3/10/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

- (void)setTitle:(NSString *)title;
- (void)startWobble;
- (void)bounceToScale:(CGFloat) scale completion:(void (^)(BOOL finished))completion;

@end
