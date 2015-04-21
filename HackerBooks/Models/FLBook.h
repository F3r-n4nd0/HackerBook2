#import "_FLBook.h"

@interface FLBook : _FLBook {}

+(instancetype)objectWithArchivedURIRepresentation:(NSData*)archivedURI context:(NSManagedObjectContext *) context;
+(instancetype)initWithDictionary:(NSDictionary*)dictionary context:(NSManagedObjectContext *) context;

- (BOOL) isFavorite;
- (void) removeToFavorites;
- (void) addToFavorites;
- (NSString*) authorsDescription;
- (NSString*) tagsDescription;
- (UIImage*) imageCover;
- (NSURL*) imageURLCover;
- (void) addCoverWithData:(NSData*) coverData;
- (NSData*) archiveURIRepresentation;
@end
