//
//  Simulator.m
//  
//
//  Created by Neo on 5/31/15.
//
//

#include <termios.h>

#import "Simulator.h"

char * getpassword(char * restrict str, int size, FILE * restrict stream) {
    struct termios old, new;

    // Turn echoing off and fail if we can’t
    if (tcgetattr(fileno(stream), &old) != 0)
        return NULL;
    new = old;
    new.c_lflag &= ~ECHO;
    if (tcsetattr(fileno(stream), TCSAFLUSH, &new) != 0)
        return NULL;

    char * buff;
    buff = fgets(str, size, stream);

    // Restore terminal
    (void) tcsetattr (fileno (stream), TCSAFLUSH, &old);

    return buff;
}

@interface Simulator () {

}
@end

@implementation Simulator

- (void)clear {
    system("clear");
}

- (void)newline {
    printf("\n");
}

- (BOOL)isQuitCommand:(NSString *)command {
    if ([command caseInsensitiveCompare:@"x"] == NSOrderedSame) return YES;
    if ([command caseInsensitiveCompare:@"q"] == NSOrderedSame) return YES;
    if ([command caseInsensitiveCompare:@"exit"] == NSOrderedSame) return YES;
    if ([command caseInsensitiveCompare:@"quit"] == NSOrderedSame) return YES;

    return NO;
}

- (NSString *)getInputWithPrompt:(NSString *)prompt size:(int)size secured:(BOOL)isSecured {
    char buff[size];

    printf("%s: ", [prompt cStringUsingEncoding:NSUTF8StringEncoding]);

    if (isSecured) {
        getpassword(buff, size, stdin);
    }
    else {
        fgets(buff, size, stdin);
    }

    return [[NSString stringWithCString:buff encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)getInputWithPrompt:(NSString *)prompt size:(int)size {
    return [self getInputWithPrompt:prompt size:size secured:NO];
}

- (NSString *)getSecuredInputWithPrompt:(NSString *)prompt size:(int)size {
    return [self getInputWithPrompt:prompt size:size secured:YES];
}

- (void)output:(NSString *)message {
    printf("> %s\n", [message cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
