//
//  System.h
//  challenge_4
//
//  Created by Virgilius Santos on 23/03/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class View;
@class User;

@interface System : NSObject

@property (copy) NSString *name;
@property (readonly) View *view;

- (void) addUserWithNickName:(NSString *)nickname;

- (void) tweetWithUser:(NSString *)message;

- (void) retweetWithUser:(int)tweetCode;

- (void) likeWithUser:(int)tweetCode;

- (void) showMeTweets;

- (void) showMeProfile;

@end
