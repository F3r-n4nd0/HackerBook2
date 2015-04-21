#import "_FLAnnotation.h"

@interface FLAnnotation : _FLAnnotation {}

+(instancetype) noteWithName:(NSString *) text
                    notebook:(FLBook*) book
                     context:(NSManagedObjectContext *) context;

@end
