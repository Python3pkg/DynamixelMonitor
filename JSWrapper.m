//
//  JSWrapper.m
//  DynamixelMonitor
//
//  Created by Slavik on 11/4/13.
//  Copyright (c) 2013 LUCS. All rights reserved.
//

#import "JSWrapper.h"
#import "WebView+LoadBundle.h"
#import "LogTextView.h"
#import "Console.h"

@implementation JSWrapper

+ (JSWrapper*)sharedInstance {
    
    static JSWrapper* inst = nil;
    if( nil == inst ) {
        inst = [[JSWrapper alloc] init];
    }
    return inst;
    
}

- (id)init {
 
    self = [super init];
    [self _setup];
    return self;
    
}

- (void)_setup {

    JSContext* context = [[JSContext alloc] init];
    self.jsContext = context;
    
//    context[@"console"] = [[Console alloc] init];
    
}

- (void)setLogView:(LogTextView *)logView {
 
    _logView = logView;
    self.jsContext[@"console"] = logView;
    
}


- (void)evalScript:(NSString*)script {
    
    NSLog(@"eval script\n%@",script);
    id ret = [self.jsContext evaluateScript:script];
    NSLog(@"js ret\n%@", ret);
}

//-(void)log:(NSString*)string {
//    
//    NSLog(@"jslog: %@", string);
//    NSTextView* logView = self.logTextView;
//    NSUInteger p = [[[logView textStorage] string] length];
//    [logView setSelectedRange:NSMakeRange(p, p)];
//    [logView insertText: string];
//    [logView insertText: @"\n"];
//    
//}

@end



