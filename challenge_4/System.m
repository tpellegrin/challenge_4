//
//  System.m
//  challenge_4
//
//  Created by Virgilius Santos on 23/03/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import "System.h"
#import "User.h"
#import "Tweet.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@interface System ()

@property User *user;
@property (copy) NSMutableArray *users;
@property (copy) NSMutableDictionary *tweets;
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
        [self populing];
    }
    return self;
}

- (void) addUserWithNickName:(NSString *)nickname{
    
    User *user = [[User alloc] initWithName:nickname];
    
    [self.users addObject:user];
}

- (void) tweetMessage:(NSString *)message{
    NSDateComponents* comps = [[NSDateComponents alloc] init];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* date = [NSDate date];
    comps.day = arc4random_uniform(30) - 55;
    comps.year = 2017;
    comps.month = 3;
    date = [calendar dateFromComponents:comps];
    Tweet *tweet = [[Tweet alloc] initWithCode:_codeTweet
                                       andUser:_user
                                       andDate:date
                                      andTweet:message];
    [self.tweets setObject:tweet forKey:[NSNumber numberWithInt:_codeTweet]];
    _codeTweet++;
}

- (void) retweetWithCode:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:_codeTweet]];
    [_user addTweet:tweetOwner];
}

- (void) likeTweetWithCode:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:_codeTweet]];
    [tweetOwner incrementLikesCount];
    [_user addLike:tweetOwner];
}

- (void) showMeTweets{
    [self showTweets:[_user getTweetsList]];
}

- (void) showMeProfile{
    NSArray *allTweets = [[[self.tweets allValues] copy]
                          sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO]]
                          ];
    
    [self showTweets:allTweets];
    
}

- (void) showTweetsLikeds{
    NSArray *allLikeds = [[self.user getLikesList]
                          sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO]]
                          ];
    [self showTweets:allLikeds];
}

- (void) showTweets:(NSArray *)list{
    NSLog(@"%@\n", _name);
    for (Tweet *tweet in list) {
        NSLog(@"%@", tweet);
    }
    NSLog(@"\n[tweet 0][tweet 1][retweet 2][like 3][show profile 4][show my tweets 5][liked tweets 6]\n");
}

- (void) populing{
    [self addUserWithNickName:@"antonio"];
    [self addUserWithNickName:@"bianca"];
    [self addUserWithNickName:@"camila"];
    [self addUserWithNickName:@"diego"];
    [self addUserWithNickName:@"eu"];
    
    
        for(int numTweets = 0; numTweets < (2+arc4random()%(20-2)); numTweets++){
            _user = [_users objectAtIndex:(arc4random()%([_users count]))];
            [self tweetMessage:[NSString stringWithFormat:@"Loren Ipsum %d",(arc4random()%(100))]];
        }
    
    
    _user = [_users objectAtIndex:0];
    
}

@end
