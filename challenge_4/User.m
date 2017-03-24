//
//  User.m
//  challenge_4
//
//  Created by Thiago Gomes Pellegrin on 3/23/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import "User.h"
#import "Likes.h"

@interface User ()

@property NSMutableArray *tweets;
@property NSMutableArray *likes;

@end

@implementation User

- (instancetype)initWithName:(NSString *)nickname
{
    self = [super init];
    if (self) {
        _nickname = nickname;
        _tweets = [NSMutableArray new];
        _likes = [NSMutableArray new];
    }
    return self;
}

- (void) addTweet:(Tweet *)tweet{
  [_tweets addObject:tweet];
}

- (void) addLike:(Likes *)like{
    for (Likes *l in _likes) {
        if ([like isEqual:l]) {
            return;
        }
    }
    [_likes addObject:like];
}

- (NSArray *) getLikesList{
  return [_likes copy];
}

- (NSArray *) getTweetsList{
  return [_tweets copy];
}
  
@end
