//
//  System.m
//  challenge_4
//
//  Created by Virgilius Santos on 23/03/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import "System.h"
#import "Likes.h"
#import "User.h"
#import "Tweet.h"

@interface System ()

@property User *user;
@property NSMutableArray *users;
@property NSMutableDictionary *tweets;
@property int codeTweet;

@end

@implementation System

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
        _users = [NSMutableArray new];
        _tweets = [NSMutableDictionary new];
        _codeTweet = 0;
    }
    return self;
}

- (void) addUserWithNickName:(NSString *)nickname{
    
    User *user = [[User alloc] initWithName:nickname];
    
    [self.users addObject:user];
}

- (void) tweetWithUser:(NSString *)message{
    Tweet *tweet = [[Tweet alloc] initWithCode:_codeTweet
                                       andUser:_user
                                       andDate:[NSDate date]
                                      andTweet:message];
    [self.tweets setObject:tweet forKey:[NSNumber numberWithInt:_codeTweet]];
    _codeTweet++;
}

- (void) retweetWithUser:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:_codeTweet]];
    [_user addTweet:tweetOwner];
}

- (void) likeWithUser:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:_codeTweet]];
    [tweetOwner incrementLikesCount];
    Likes *like = [[Likes alloc] init:_user andLastLikeDate:[NSDate date] andTweet:tweetOwner];
    [_user addLike:like];
}

- (void) showMeTweets{
    for (Tweet *t in [_user getTweetsList]) {
        NSLog(@"%@", t.tweet);
    }
}

- (void) showMeProfile{
    
}


@end
