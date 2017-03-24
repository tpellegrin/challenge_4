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

- (instancetype)initWithName:(NSString *)name;

- (void) addTweet:(Tweet *)tweet;

- (void) addLikes:(Likes *)likes;

- (NSArray *) getLikesList;

- (NSArray *) getTweetsList;

@end

  
