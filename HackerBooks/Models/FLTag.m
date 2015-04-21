#import "FLTag.h"
#import "FLBook.h"
#import "FLBookDetailTag.h"

#define FAVORITE_TAG_NAME @"favorites"

@implementation FLTag

static FLTag *favoriteTag;

+(instancetype)initWithTag:(NSString*) name context:(NSManagedObjectContext *) context {
    FLTag *newTag = [FLTag insertInManagedObjectContext:context];
    newTag.name = name;
    return newTag;
}

+(FLTag*) obtainOrCreateIfNecessaryTagFavorites:(NSManagedObjectContext *) context {
    
    if(favoriteTag) {
        return favoriteTag;
    }
    NSFetchRequest *req = [NSFetchRequest
                           fetchRequestWithEntityName:[FLTag entityName]];
    [req setPredicate:[NSPredicate predicateWithFormat:@"name = %@", FAVORITE_TAG_NAME]];
    [req setFetchLimit:1];
    NSError *error;
    FLTag *tag = [[context executeFetchRequest:req error:&error] firstObject];
    if(error) {
        NSLog(@"Error to get tag from name : %@",error);
        return nil;
    }
    if(!tag) {
        tag =  [FLTag insertInManagedObjectContext:context];
        tag.name = FAVORITE_TAG_NAME;
    }
    tag.sort = [NSNumber numberWithInt:0];
    favoriteTag = tag;
    return tag;
}

-(NSString*)description {
    return self.name;
}


-(BOOL) containBook:(FLBook*) book {
    for (FLBookDetailTag *detailBook in self.booksDetails) {
        if(book == detailBook.book) {
            return true;
        }
    }
    return NO;
}


@end
