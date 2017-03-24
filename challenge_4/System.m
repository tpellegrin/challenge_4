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

- (void) tweetWithUser:(User *)user andMessage:(NSString *)message{
    Tweet *tweet = [[Tweet alloc] initWithCode:_codeTweet
                                       andUser:user
                                       andDate:[NSDate date]
                                      andTweet:message];
    [self.tweets setObject:tweet forKey:[NSNumber numberWithInt:_codeTweet]];
    _codeTweet++;
}

- (void) retweetWithUser:(User *)user andTweetCode:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:_codeTweet]];
    [user addTweet:tweetOwner];
}

- (void) likeWithUser:(User *)user andTweetCode:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:_codeTweet]];
    [tweetOwner incrementLikesCount];
    Likes *like = [[Likes alloc] init:user andLastLikeDate:[NSDate date] andTweet:tweetOwner];
    [user addLike:like];
}


- (void) showMeTweets{
    
}


- (void) showMeProfile{
    
}


- (void) showProfile:(NSString *)nickname{
    
}


@end
