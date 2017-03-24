//
//  Likes.h
//  challenge_4
//
//  Created by Thiago Gomes Pellegrin on 3/23/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Likes : NSObject

@property User *user;
@property NSDate *lastLikeDate;

@end
