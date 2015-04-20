#import "_FLTag.h"

@interface FLTag : _FLTag {}

+(instancetype)initWithTag:(NSString*) name context:(NSManagedObjectContext *) context;

-(NSComparisonResult)compareTagWithFavorites:(id) otherTag;

@end
