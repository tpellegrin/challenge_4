//
//  Likes.m
//  challenge_4
//
//  Created by Thiago Gomes Pellegrin on 3/23/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import "Likes.h"

@implementation Likes

- (instancetype)init:(User *)user andLikes:(int)likes andLastLikeDate:(NSDate *)lastLikeDate
                    andTweet:(NSString *)tweet
{
    self = [super init];
    if (self) {
        _user = user;
        _likesCount = likes;
        _lastLikeDate = lastLikeDate;
    }
    return self;
}


@end
