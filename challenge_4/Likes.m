//
//  Likes.m
//  challenge_4
//
//  Created by Thiago Gomes Pellegrin on 3/23/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import "Likes.h"

@implementation Likes

- (instancetype)init:(User *)user andLastLikeDate:(NSDate *)lastLikeDate
                    andTweet:(Tweet *)tweet
{
    self = [super init];
    if (self) {
        _user = user;
        _lastLikeDate = lastLikeDate;
    }
    return self;
}


@end
