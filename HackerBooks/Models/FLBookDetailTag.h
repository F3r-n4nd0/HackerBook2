#import "_FLBookDetailTag.h"

@interface FLBookDetailTag : _FLBookDetailTag {}

+(instancetype)initWithTagName:(NSString*) tagName andBook:(FLBook*) book context:(NSManagedObjectContext *) context;

-(NSComparisonResult)compareTagWithFavorites:(FLBookDetailTag*) otherDetailTag;

@end
