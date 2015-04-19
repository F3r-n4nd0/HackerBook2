#import "_FLBookDetailAuthor.h"

@interface FLBookDetailAuthor : _FLBookDetailAuthor {}

+(instancetype)initWithAuthorName:(NSString*) authorName andBook:(FLBook*) book context:(NSManagedObjectContext *) context;

@end
