//
//  Interpreter.m
//  Simulator
//
//  Created by Neo on 5/31/15.
//  Copyright (c) 2015 Hujiang.com. All rights reserved.
//

#import "Interpreter.h"

@implementation Interpreter

- (NSString *)loginWithUsername:(NSString *)username password:(NSString *)password {
    NSString *response = [NSString stringWithFormat:@"Logged in as '%@'(%@)", username, password];

    return response;
}

- (NSString *)handleCommand:(NSString *)command {
    NSString *response = [NSString stringWithFormat:@"ECHO %@", command];

    return response;
}

@end
