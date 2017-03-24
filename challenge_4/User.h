//
//  User.h
//  challenge_4
//
//  Created by Thiago Gomes Pellegrin on 3/23/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Tweet;
@class Likes;

@interface User : NSObject

@property NSString *nickname;

- (instancetype)initWithName:(NSString *)nickname;

- (void) addTweet:(Tweet *)tweet;

- (void) addLike:(Tweet *)like;

- (NSArray *) getLikesList;

- (NSArray *) getTweetsList;

@end

  
