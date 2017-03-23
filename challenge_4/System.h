//
//  System.h
//  challenge_4
//
//  Created by Virgilius Santos on 23/03/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class View;

@interface System : NSObject

@property (readonly) View *view;

- (void) tweet:(NSString *)message;

- (void) retweet:(int)tweetCode;

- (void) like:(int)tweetCode;

- (void) showMeTweets;

- (void) showMeProfile;

- (void) showProfile:(NSString *)nickname;


@end
