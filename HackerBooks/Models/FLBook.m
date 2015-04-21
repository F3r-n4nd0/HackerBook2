#import <UIKit/UIKit.h>
#import "FLBook.h"
#import "FLBookDetailTag.h"
#import "FLBookDetailAuthor.h"
#import "FLTag.h"
#import "FLPhoto.h"

@interface FLBook ()

// Private interface goes here.

@end

@implementation FLBook


+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context{
    
    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) {
        return nil;
    }
    
    
    NSManagedObjectID *nid = [context.persistentStoreCoordinator
                              managedObjectIDForURIRepresentation:uri];
    if (nid == nil) {
        return nil;
    }
    
    
    NSManagedObject *ob = [context objectWithID:nid];
    if (ob.isFault) {
        // Got it!
        return (FLBook*)ob;
    }else{
        // Might not exist anymore. Let's fetch it!
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:ob.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", ob];
        
        NSError *error;
        NSArray *res = [context executeFetchRequest:req
                                              error:&error];
        if (res == nil) {
            return nil;
        }else{
            return [res lastObject];
        }
    }
    
    
}

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

- (BOOL) isFavorite {
    FLTag *favoriteTag = [FLTag obtainOrCreateIfNecessaryTagFavorites:self.managedObjectContext];
    return [self containTag:favoriteTag];
}

- (void) removeToFavorites {
    FLTag *favoriteTag = [FLTag obtainOrCreateIfNecessaryTagFavorites:self.managedObjectContext];
    [self removeTag:favoriteTag];
}

- (void) addToFavorites {    
    FLTag *favoriteTag = [FLTag obtainOrCreateIfNecessaryTagFavorites:self.managedObjectContext];
    [self addTag:favoriteTag];
}

-(NSString*) tagsDescription {
    
    return [[self tags] componentsJoinedByString:@" , "];
}


-(NSArray*) tags {
    NSMutableArray *tags = [NSMutableArray array];
    for (FLBookDetailTag *detailTag in self.tagsDetails) {
        [tags addObject:detailTag.tag];
    }
    return [tags copy];
}

-(NSString*) authorsDescription {

    return [[self authors] componentsJoinedByString:@" , "];
}


-(NSArray*) authors {
    NSMutableArray *authors = [NSMutableArray array];
    for (FLBookDetailAuthor *detailAuthor in self.authorsDetails) {
        [authors addObject:detailAuthor.author];
    }
    return [authors copy];
}

#pragma mark - Tag

- (BOOL)containTag:(FLTag*)tag {
    for (FLBookDetailTag *detailTag in self.tagsDetails) {
        if(tag == detailTag.tag) {
            return true;
        }
    }
    return NO;
}

- (void)removeTag:(FLTag*)tag {
    for (FLBookDetailTag *detailTag in tag.booksDetails) {
        if(self == detailTag.book) {
            [self.managedObjectContext deleteObject:detailTag];
            return;
        }
    }
}

- (void)addTag:(FLTag*)tag {
    [FLBookDetailTag initWithTag:tag andBook:self context:self.managedObjectContext];
}


#pragma mark - override

-(NSString*)description {
    return self.title;
}


-(UIImage*) imageCover {
    if(self.cover){
        return self.cover.image;
    }
    return nil;
}

- (NSURL*) imageURLCover {
    return  [NSURL URLWithString:self.coverURL];
}

- (void) addCoverWithData:(NSData*) coverData {
    [FLPhoto initWithDat:coverData andBook:self andAnnotation:nil context:self.managedObjectContext];
}

-(NSData*) archiveURIRepresentation{
    
    NSURL *uri = self.objectID.URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}

@end
