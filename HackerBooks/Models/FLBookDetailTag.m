#import "FLBookDetailTag.h"
#import "FLTag.h"

@interface FLBookDetailTag ()

// Private interface goes here.

@end

@implementation FLBookDetailTag

+(instancetype)initWithTag:(FLTag*) tag andBook:(FLBook*) book context:(NSManagedObjectContext *) context {
    FLBookDetailTag *newBook = [FLBookDetailTag insertInManagedObjectContext:context];
    newBook.book = book;
    newBook.tag = tag;
    return newBook;
}


+(instancetype)initWithTagName:(NSString*) tagName andBook:(FLBook*) book context:(NSManagedObjectContext *) context {
    NSFetchRequest *req = [NSFetchRequest
                           fetchRequestWithEntityName:[FLTag entityName]];
    [req setPredicate:[NSPredicate predicateWithFormat:@"name = %@", tagName]];
    [req setFetchLimit:1];
    NSError *error;
    FLTag *tag = [[context executeFetchRequest:req error:&error] firstObject];
    if(error) {
        NSLog(@"Error to get tag from name : %@",error);
        return nil;
    }
    if(!tag) {
        tag = [FLTag  initWithTag:tagName context:context];
    }
    return [self initWithTag:tag andBook:book context:context];
}


-(NSComparisonResult)compareTagWithFavorites:(FLBookDetailTag*) otherDetailTag {
    if([otherDetailTag.tag.name isEqualToString:@"favorites"]) {
        return NSOrderedAscending;
    }
    return [self.tag.name caseInsensitiveCompare:otherDetailTag.tag.name];
}

-(NSString*)description {
    return [NSString stringWithFormat:@"%@ - %@",self.book,self.tag];
}


@end
