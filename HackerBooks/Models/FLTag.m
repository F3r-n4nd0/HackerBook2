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

-(NSComparisonResult)compareTagWithFavorites:(id) otherObject {
    FLTag *otherTag = otherObject;
    if([otherTag.name isEqualToString:@"favorites"]) {
        return NSOrderedAscending;
    }
    return [self.name caseInsensitiveCompare:otherTag.name];
}

@end
