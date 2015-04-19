// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLAnnotation.h instead.

@import CoreData;
#import "FLHackerBookBaseClass.h"

extern const struct FLAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *text;
} FLAnnotationAttributes;

extern const struct FLAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *photo;
} FLAnnotationRelationships;

@class FLBook;
@class FLLocation;
@class FLPhoto;

@interface FLAnnotationID : NSManagedObjectID {}
@end

@interface _FLAnnotation : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLLocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _FLAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (FLBook*)primitiveBook;
- (void)setPrimitiveBook:(FLBook*)value;

- (FLLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(FLLocation*)value;

- (FLPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(FLPhoto*)value;

@end
