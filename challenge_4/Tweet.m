//
//  Tweet.m
//  challenge_4
//
//  Created by Virgilius Santos on 23/03/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import "Tweet.h"
#import "User.h"

@implementation Tweet

- (instancetype)initWithCode:(int)code andUser:(User *)user andDate:(NSDate *)date
                    andTweet:(NSString *)tweet
{
    self = [super init];
    if (self) {
        _code = code;
        _user = user;
        [user addTweet:self];
        _date = [date copy];
        _tweet = [tweet copy];
        _likesCount = 0;
    }
    return self;
}

-(void)incrementLikesCount{
    _likesCount++;
}

@end
