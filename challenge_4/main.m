//
//  main.m
//  challenge_4
//
//  Created by Thiago Gomes Pellegrin on 3/23/17.
//  Copyright © 2017 TP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "System.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        System *system = [[System alloc] initWithName:@"Twitter 4.2"];
        
        [system showMeTweets];
        
        
    }
    return 0;
}
