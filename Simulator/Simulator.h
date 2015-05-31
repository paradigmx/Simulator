//
//  Simulator.h
//  
//
//  Created by Neo on 5/31/15.
//
//

#import <Foundation/Foundation.h>

@interface Simulator : NSObject
- (void)clear;
- (void)newline;

- (BOOL)isQuitCommand:(NSString *)command;

- (NSString *)getInputWithPrompt:(NSString *)prompt size:(int)size;
- (NSString *)getSecuredInputWithPrompt:(NSString *)prompt size:(int)size;
- (void)output:(NSString *)message;
@end
