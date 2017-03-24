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
        
        BOOL process = YES ;
        
        do {
            
            NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
            NSData *inputData = [input availableData];
            
            NSString *str = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
            NSString *first = [str componentsSeparatedByString:@" "][0];
            
            
            NSString *last;
            NSRange rng;
            
            int scannedNumber;
            NSScanner *scanner = [NSScanner scannerWithString:first];
            [scanner scanInt:&scannedNumber];
            NSLog(@"%@", first);
            
            switch (scannedNumber) {
                case 1:
                    rng = [str rangeOfString:@" "];
                    last = [str substringFromIndex:rng.location + 1];
                    
                    [system tweetMessage:last];
                    break;
                    
                case 2:
                    last = [str componentsSeparatedByString:@" "][1];
                    int scannedNumber2;
                    scanner = [NSScanner scannerWithString:last];
                    [scanner scanInt:&scannedNumber2];
                    [system retweetWithCode:scannedNumber2];
                    break;
                    
                case 3:
                    last = [str componentsSeparatedByString:@" "][1];
                    int scannedNumber3;
                    scanner = [NSScanner scannerWithString:last];
                    [scanner scanInt:&scannedNumber3];
                    
                    [system likeTweetWithCode:scannedNumber3];
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
