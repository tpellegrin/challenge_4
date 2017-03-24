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
        
        [system showMeProfile];
        
        [system tweetMessage:@"teste"];
        BOOL process = YES ;
        
        do {
            
            NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
            NSData *inputData = [input availableData];
            
            NSString *str = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
            
            NSRange rng = [str rangeOfString:@" "];
            NSString *first = [str substringToIndex:rng.location];
            NSString *last = [str substringFromIndex:rng.location + 1];
            
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            NSNumber *myNumber = [numberFormatter numberFromString:first];
            
            switch ([myNumber integerValue]) {
                case 1:
                    [system tweetMessage:last];
                    break;
                    
                case 2:
                    [system retweetWithCode:[[numberFormatter numberFromString:last] intValue]];
                    break;
                    
                case 3:
                    [system likeTweetWithCode:[[numberFormatter numberFromString:last] intValue]];
                    break;
                
                case 4:
                    [system showMeProfile];
                    break;
                    
                case 5:
                    [system showMeTweets];
                    break;
                    
                case 6:
                    [system showTweetsLikeds];
                    break;
                    
                case 0:
                    process = NO;
                    break;
                    
                
                default:
                    process = NO;
                    break;
            }
        } while (process==YES);
        
    }
    return 0;
}
