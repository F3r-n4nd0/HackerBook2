// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLPhoto.h instead.

@import CoreData;
#import "FLHackerBookBaseClass.h"

extern const struct FLPhotoAttributes {
	__unsafe_unretained NSString *photoData;
	__unsafe_unretained NSString *thumbPhotoData;
} FLPhotoAttributes;

extern const struct FLPhotoRelationships {
	__unsafe_unretained NSString *annotation;
	__unsafe_unretained NSString *book;
} FLPhotoRelationships;

@class FLAnnotation;
@class FLBook;

@interface FLPhotoID : NSManagedObjectID {}
@end

@interface _FLPhoto : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* thumbPhotoData;

//- (BOOL)validateThumbPhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLAnnotation *annotation;

//- (BOOL)validateAnnotation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _FLPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSData*)primitiveThumbPhotoData;
- (void)setPrimitiveThumbPhotoData:(NSData*)value;

- (FLAnnotation*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(FLAnnotation*)value;

- (FLBook*)primitiveBook;
- (void)setPrimitiveBook:(FLBook*)value;

@end
