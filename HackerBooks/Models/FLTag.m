#import "FLTag.h"

@interface FLTag ()

// Private interface goes here.

@end

@implementation FLTag

+(instancetype)initWithTag:(NSString*) name context:(NSManagedObjectContext *) context {
    FLTag *newTag = [FLTag insertInManagedObjectContext:context];
    newTag.name = name;
    return newTag;
}

@end
