#import "_FLTag.h"
@class FLBook;

@interface FLTag : _FLTag {}

+(instancetype)initWithTag:(NSString*) name context:(NSManagedObjectContext *) context;
+(FLTag*) obtainOrCreateIfNecessaryTagFavorites:(NSManagedObjectContext *) context;

-(BOOL) containBook:(FLBook*) book ;

@end
