#import "_FLBookDetailTag.h"

@interface FLBookDetailTag : _FLBookDetailTag {}

+(instancetype)initWithTag:(FLTag*) tag andBook:(FLBook*) book context:(NSManagedObjectContext *) context;
+(instancetype)initWithTagName:(NSString*) tagName andBook:(FLBook*) book context:(NSManagedObjectContext *) context;

@end
