//
//  Notification.m
//  Notifications
//
//  Created by Matej Hrescak on 2/21/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "Notification.h"

@implementation Notification

- (id)initWithDictionary:(NSDictionary *)dictionary{
    self.notificationText = dictionary[@"notificationText"];
    self.time = dictionary[@"time"];
    self.imageUrl = dictionary[@"imageUrl"];
    self.iconName = dictionary[@"iconName"];
    
    return self;
}

+ (NSMutableArray *)fakeNotifications{
    NSMutableArray *notifications = [[NSMutableArray alloc] init];
    
    Notification *john = [[Notification alloc] initWithDictionary:
                          @{@"notificationText": @"<strong>John Doe</strong> has commented on a post you're following in <strong>Bay Area Car Wreck Specialists</strong>",
                            @"time": @"2 hours ago",
                            @"imageUrl":@"http://graph.facebook.com/hrescak/picture?width=320",
                            @"iconName":@"icon-group-graduation-16px"}
                            ];
    [notifications addObject:john];
    
    Notification *mike = [[Notification alloc] initWithDictionary:
                          @{@"notificationText": @"<strong>Mike Landau</strong> liked your post in <strong>Notification Settings XFN</strong>",
                            @"time": @"3 hours ago",
                            @"imageUrl":@"http://graph.facebook.com/mikelandau/picture?width=320",
                            @"iconName":@"icon-like-16px"}
                          ];
    [notifications addObject:mike];
    
    Notification *tim = [[Notification alloc] initWithDictionary:
                          @{@"notificationText": @"<strong>Timoty Lee</strong> mentioned you in a comment in  <strong>iOS Bootcamp for Designers</strong>:\"Matej Hrescak Here's a DTCoreText snippet...\"",
                            @"time": @"3 hours ago",
                            @"imageUrl":@"http://graph.facebook.com/timothy1ee/picture?width=320",
                            @"iconName":@"icon-group-apple-16px"}
                          ];
    [notifications addObject:tim];
    
    Notification *kyle = [[Notification alloc] initWithDictionary:
                         @{@"notificationText": @"<strong>Kyle Meyer</strong> mentioned you in a comment:\"Matej, Golden gate park uses that model...\"",
                           @"time": @"4 hours ago",
                           @"imageUrl":@"http://graph.facebook.com/kpmeyer/picture?width=320",
                           @"iconName":@"icon-comment-16px"}
                         ];
    [notifications addObject:kyle];
    
    Notification *brandon = [[Notification alloc] initWithDictionary:
                          @{@"notificationText": @"<strong>Brandon Walkin</strong> posted in <strong>iPhone & iPad Feedback</strong>:\"When can we expect butterflies and rainbows in the secret...\"",
                            @"time": @"4 hours ago",
                            @"imageUrl":@"http://graph.facebook.com/bwalkin/picture?width=320",
                            @"iconName":@"icon-group-bone-16px"}
                          ];
    [notifications addObject:brandon];
    
    Notification *kyletwo = [[Notification alloc] initWithDictionary:
                          @{@"notificationText": @"<strong>Kyle Meyer</strong>, <strong>Nathan Borror</strong> and <strong>Jonathon Toon</strong> liked your comment:\"Are you setting it up directly on the...\"",
                            @"time": @"4 hours ago",
                            @"imageUrl":@"http://graph.facebook.com/kpmeyer/picture?width=320",
                            @"iconName":@"icon-like-16px"}
                          ];
    [notifications addObject:kyletwo];
    
    Notification *jonathon = [[Notification alloc] initWithDictionary:
                             @{@"notificationText": @"<strong>Jonathon Toon</strong> also commented on a post in <strong> iOS Bootcamp for Designers</strong> :\"It's all being done in the AppDelegate...\"",
                               @"time": @"4 hours ago",
                               @"imageUrl":@"http://graph.facebook.com/jonathontoon/picture?width=320",
                               @"iconName":@"icon-apple-16px"}
                             ];
    [notifications addObject:jonathon];
    
    return notifications;
}

@end
