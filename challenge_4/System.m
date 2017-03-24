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
@property int lastPage;

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
        _lastPage = 1;
        [self populing];
    }
    return self;
}

- (void) addUserWithNickName:(NSString *)nickname{
    
    User *user = [[User alloc] initWithName:nickname];
    
    [self.users addObject:user];
}

- (void) tweetMessage:(NSString *)message{
    Tweet *tweet = [[Tweet alloc] initWithCode:_codeTweet
                                       andUser:_user
                                       andDate:[NSDate date]
                                      andTweet:message];
    [self.tweets setObject:tweet forKey:[NSNumber numberWithInt:_codeTweet]];
    _codeTweet++;
    [self atualiza];
}

- (void) retweetWithCode:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:tweetCode]];
    [_user addTweet:tweetOwner];
    tweetOwner.date = [NSDate date];
    [self atualiza];
 
}

- (void) likeTweetWithCode:(int)tweetCode{
    Tweet *tweetOwner = _tweets[[NSNumber numberWithInt:tweetCode]];
    [tweetOwner incrementLikesCount];
    [_user addLike:tweetOwner];
    [self atualiza];
}

- (void) showMeTweets{
    _lastPage = 0;
    [self showTweets:[_user getTweetsList]];
}

- (void) showMeProfile{
    _lastPage = 1;
    NSArray *allTweets = [[[self.tweets allValues] copy]
                          sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES]]
                          ];
    
    [self showTweets:allTweets];
    
}

- (void) showTweetsLikeds{
    _lastPage = 2;
    NSArray *allLikeds = [[self.user getLikesList]
                          sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES]]
                          ];
    [self showTweets:allLikeds];
}

- (void) showTweets:(NSArray *)list{
    NSLog(@"%@\n", _name);
    for (Tweet *tweet in list) {
        NSLog(@"%@", tweet);
    }
    NSLog(@"\n[sair 0][tweet 1][retweet 2][like 3][show profile 4][show my tweets 5][liked tweets 6]\n");
}

- (void) atualiza{
    if(_lastPage==0){
        [self showMeTweets];
        
    } else if (_lastPage==1) {
        [self showMeProfile];
    } else if (_lastPage==2)
        [self showTweetsLikeds];
    
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
    
        NSDateComponents* comps = [[NSDateComponents alloc] init];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDate* date = [NSDate date];
    
    
        for (Tweet *t in [_tweets allValues]) {
            comps.day = arc4random_uniform(30) - 57;
            comps.year = 2017;
            comps.month = 3;
            date = [calendar dateFromComponents:comps];
            t.date = date;
        }
    
        _user = [_users objectAtIndex:0];
}

@end
