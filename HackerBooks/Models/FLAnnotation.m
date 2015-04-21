#import "FLAnnotation.h"

@interface FLAnnotation ()

// Private interface goes here.

@end

@implementation FLAnnotation


#pragma mark -  Class Methods
+(NSArray *) observableKeys{
    return @[FLAnnotationAttributes.text];
}

+(instancetype) noteWithName:(NSString *) text
                    notebook:(FLBook*) book
                     context:(NSManagedObjectContext *) context{
    
    FLAnnotation *n = [self insertInManagedObjectContext:context];
    
    n.creationDate = [NSDate date];
    n.text = text;
    n.book = book;
    n.modificationDate = [NSDate date];
    
    return n;
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    self.modificationDate = [NSDate date];
    
}


@end
