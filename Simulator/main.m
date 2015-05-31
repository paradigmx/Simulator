//
//  main.m
//  Simulator
//
//  Created by Neo on 5/31/15.
//  Copyright (c) 2015 Hujiang.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Simulator.h"
#import "Interpreter.h"

#define LOGIN_INPUT_SIZE 50
#define COMMAND_INPUT_SIZE 200

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Simulator started.");

        Simulator *simulator = [[Simulator alloc] init];
        Interpreter *interpreter = [[Interpreter alloc] init];

        NSString *username = [simulator getInputWithPrompt:@"Enter your username" size:LOGIN_INPUT_SIZE];
        NSString *password = [simulator getPasswordWithPrompt:@"Enter password" size:LOGIN_INPUT_SIZE];

        NSString *response = [interpreter loginWithUsername:username password:password];

        [simulator newline];
        [simulator output:response];

        NSString *command;
        while (true) {
            command = [simulator getInputWithPrompt:@"Command" size:COMMAND_INPUT_SIZE];

            if ([simulator isQuitCommand:command]) break;

            response = [interpreter handleCommand:command];

            [simulator output:response];
        }

        NSLog(@"Simulator ended.");
    }
    return 0;
}
