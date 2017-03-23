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

- (void) tweetWithUser:(User *)user andMessage:(NSString *)message;

- (void) retweet:(int)tweetCode;

- (void) like:(int)tweetCode;

- (void) showMeTweets;

- (void) showMeProfile;

- (void) showProfile:(NSString *)nickname;


@end
