//
//  NotificationCell.m
//  Notifications
//
//  Created by Matej Hrescak on 2/21/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "NotificationCell.h"
#import "UIImageView+AFNetworking.h"
#import "TTTAttributedLabel.h"
#import <Slash/Slash.h>

@interface NotificationCell()
//@property (weak, nonatomic) IBOutlet UILabel *noticationLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) TTTAttributedLabel *notificationLabel;

@end

@implementation NotificationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.notificationLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(88, 4, 220, 60)];
        self.notificationLabel.numberOfLines = 0;
        self.notificationLabel.textColor = [UIColor colorWithRed:0.14 green:0.16 blue:0.21 alpha:1.0];
        self.notificationLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentTop;
        [self.contentView addSubview:self.notificationLabel];
    }
    return self;
}

- (void)setUpWithNotification:(Notification *)notification{

    NSDictionary *style = @{
                            @"$default" : @{NSFontAttributeName  : [UIFont fontWithName:@"HelveticaNeue" size:14]},
                            @"strong"   : @{NSFontAttributeName  : [UIFont fontWithName:@"HelveticaNeue-Medium" size:14]},
                            };
    NSAttributedString *attributedString = [SLSMarkupParser attributedStringWithMarkup:notification.notificationText style:style error:NULL];
    self.notificationLabel.text = attributedString;
    self.timestampLabel.text = notification.time;
    self.timestampLabel.textColor = [UIColor colorWithRed:0.68 green:0.70 blue:0.73 alpha:1.0];
    NSURL *imageUrl = [NSURL URLWithString:notification.imageUrl];
    [self.profilePictureView setImageWithURL:imageUrl];
    self.iconView.image = [UIImage imageNamed:notification.iconName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

@end
