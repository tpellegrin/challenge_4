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

- (void) retweetWithUser:(User *)user andTweetCode:(int)tweetCode;

- (void) likeWithUser:(User *)user andTweetCode:(int)tweetCode;

- (void) showMeTweets;

- (void) showMeProfile;

@end
