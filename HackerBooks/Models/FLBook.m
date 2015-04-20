#import "FLBook.h"
#import "FLBookDetailTag.h"
#import "FLBookDetailAuthor.h"

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
    if (![self isNullObject:[dictionary objectForKey:@"tags"]]) {
        NSString* stringTags = [dictionary objectForKey:@"tags"];
        NSArray *arrayTags = [self trimWhitespaceFromArray:[stringTags componentsSeparatedByString:@","]];
        for (NSString *tagName in arrayTags) {
            [FLBookDetailTag initWithTagName:tagName andBook:newBook context:context];
        }
    }
    if (![self isNullObject:[dictionary objectForKey:@"authors"]]) {
        NSString* stringAuthors = [dictionary objectForKey:@"authors"];
        NSArray *arrayAuthors = [self trimWhitespaceFromArray:[stringAuthors componentsSeparatedByString:@","]];
        for (NSString *authorName in arrayAuthors) {
            [FLBookDetailAuthor initWithAuthorName:authorName andBook:newBook context:context];
        }
    }
    newBook.isFavorite = [NSNumber numberWithBool:NO];
    return newBook;
}

+ (BOOL)isNullObject:(id)obj{
    if (obj != nil && ![obj isKindOfClass:[NSNull class]]) {
        return NO;
    } else {
        return YES;
    }
}

+(NSArray*) trimWhitespaceFromArray:(NSArray*) array {
    NSMutableArray *trimmedStrings = [NSMutableArray arrayWithCapacity:array.count];
    for (NSString *string in array) {
        NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        [trimmedStrings addObject:trimmedString];
    }
    return [trimmedStrings  copy];
}


@end
