//
//  FLHackerBookBaseClass.m
//  HackerBooks
//
//  Created by Fernando on 4/19/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "FLHackerBookBaseClass.h"

@implementation FLHackerBookBaseClass

#pragma mark - Class methods
+(NSArray*)observableKeys{
    
    return @[];
}

#pragma mark - Life cycle
-(void) awakeFromInsert{
    [super awakeFromInsert];
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    [self setupKVO];
    
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    [self tearDownKVO];
}

#pragma mark - KVO
-(void) setupKVO{
    
    for (NSString *key in [[self class] observableKeys]) {
        
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
        
    }
    
}

-(void) tearDownKVO{
    for (NSString *key in [[self class] observableKeys]) {
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}


@end
