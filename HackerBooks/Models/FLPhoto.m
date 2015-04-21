#import <UIKit/UIKit.h>
#import "FLPhoto.h"


@interface FLPhoto ()

// Private interface goes here.

@end

@implementation FLPhoto

+(instancetype)initWithDat:(NSData*) data andBook:(FLBook*) book andAnnotation:(FLAnnotation*) annotation context:(NSManagedObjectContext *) context {
    FLPhoto *newPhoto = [FLPhoto insertInManagedObjectContext:context];
    newPhoto.book = book;
    newPhoto.annotation = annotation;
    newPhoto.photoData= data;
    return newPhoto;
}

-(void) setImage:(UIImage *)image{
    
    // Convertir la UIImage en un NSData
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

-(UIImage *) image{
    
    // Convertir la NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

@end
