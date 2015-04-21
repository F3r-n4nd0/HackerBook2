#import "_FLPhoto.h"


@interface FLPhoto : _FLPhoto {}

+(instancetype)initWithDat:(NSData*) data andBook:(FLBook*) book andAnnotation:(FLAnnotation*) annotation context:(NSManagedObjectContext *) context;

-(void) setImage:(UIImage *)image;
-(UIImage *) image;

@end
