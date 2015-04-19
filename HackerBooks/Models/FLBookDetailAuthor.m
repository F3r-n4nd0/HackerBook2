#import "FLBookDetailAuthor.h"
#import "FLAuthor.h"

@interface FLBookDetailAuthor ()

// Private interface goes here.

@end

@implementation FLBookDetailAuthor

+(instancetype)initWithAuthor:(FLAuthor*) author andBook:(FLBook*) book context:(NSManagedObjectContext *) context {
    FLBookDetailAuthor *newBook = [FLBookDetailAuthor insertInManagedObjectContext:context];
    newBook.book = book;
    newBook.author = author;
    return newBook;
}


+(instancetype)initWithAuthorName:(NSString*) authorName andBook:(FLBook*) book context:(NSManagedObjectContext *) context {
    NSFetchRequest *req = [NSFetchRequest
                           fetchRequestWithEntityName:[FLAuthor entityName]];
    [req setPredicate:[NSPredicate predicateWithFormat:@"name = %@", authorName]];
    [req setFetchLimit:1];
    NSError *error;
    FLAuthor *author = [[context executeFetchRequest:req error:&error] firstObject];
    if(error) {
        NSLog(@"Error to get author from name : %@",error);
        return nil;
    }
    if(!author) {
        author = [FLAuthor  initWithAuthorName:authorName context:context];
    }
    return [self initWithAuthor:author andBook:book context:context];
}

@end
