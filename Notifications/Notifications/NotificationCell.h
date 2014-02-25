//
//  NotificationCell.h
//  Notifications
//
//  Created by Matej Hrescak on 2/21/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"
@interface NotificationCell : UITableViewCell

- (void)setUpWithNotification:(Notification *)notification;

@end
