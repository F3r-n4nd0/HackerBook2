#import "FLAuthor.h"

@interface FLAuthor ()

// Private interface goes here.

@end

@implementation FLAuthor

+(instancetype)initWithAuthorName:(NSString*) name context:(NSManagedObjectContext *) context {
    FLAuthor *newAuthor = [FLAuthor insertInManagedObjectContext:context];
    newAuthor.name = name;
    return newAuthor;
}

@end
