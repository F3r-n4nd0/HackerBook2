#import "FLBook.h"

@interface FLBook ()

// Private interface goes here.

@end

@implementation FLBook

+(instancetype)initWithDictionary:(NSDictionary*)dictionary context:(NSManagedObjectContext *) context {
    FLBook *newBook = [FLBook insertInManagedObjectContext:context];
    if (![self isNullObject:[dictionary objectForKey:@"title"]]) {
        newBook.title = [dictionary objectForKey:@"title"];
    }
    if (![self isNullObject:[dictionary objectForKey:@"image_url"]]) {
        newBook.coverURL = [dictionary objectForKey:@"image_url"];
    }
    if (![self isNullObject:[dictionary objectForKey:@"pdf_url"]]) {
        newBook.pdfURL = [dictionary objectForKey:@"pdf_url"];
    }
    
    return newBook;
}

+ (BOOL)isNullObject:(id)obj{
    if (obj != nil && ![obj isKindOfClass:[NSNull class]]) {
        return NO;
    } else {
        return YES;
    }
}


@end
