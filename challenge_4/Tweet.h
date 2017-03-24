//
//  Tweet.h
//  challenge_4
//
//  Created by Virgilius Santos on 23/03/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;


@interface Tweet : NSObject


@property (readonly) int code;
@property (weak, readonly) User *user;
@property (copy) NSDate *date;
@property (copy, readonly) NSString *tweet;
@property (readonly) int likesCount;

- (instancetype)initWithCode:(int)code andUser:(User *)user andDate:(NSDate *)date
                    andTweet:(NSString *)tweet;

-(void)incrementLikesCount;

@end
