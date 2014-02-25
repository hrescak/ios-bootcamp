    //
//  Notification.h
//  Notifications
//
//  Created by Matej Hrescak on 2/21/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject

@property (nonatomic, strong) NSString *notificationText;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *iconName;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSMutableArray *)fakeNotifications;
@end
