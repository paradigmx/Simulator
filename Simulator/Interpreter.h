//
//  Interpreter.h
//  Simulator
//
//  Created by Neo on 5/31/15.
//  Copyright (c) 2015 Hujiang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interpreter : NSObject
- (NSString *)loginWithUsername:(NSString *)username password:(NSString *)password;
- (NSString *)handleCommand:(NSString *)command;
@end
