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

- (instancetype)initWithName:(NSString *)name;

- (void) addUserWithNickName:(NSString *)nickname;

- (void) tweetMessage:(NSString *)message;

- (void) retweetWithCode:(int)tweetCode;

- (void) likeTweetWithCode:(int)tweetCode;

- (void) showMeTweets;

- (void) showMeProfile;

- (void) showTweetsLikeds;

@end
