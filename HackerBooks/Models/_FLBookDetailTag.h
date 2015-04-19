// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLBookDetailTag.h instead.

@import CoreData;
#import "FLHackerBookBaseClass.h"

extern const struct FLBookDetailTagRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *tag;
} FLBookDetailTagRelationships;

@class FLBook;
@class FLTag;

@interface FLBookDetailTagID : NSManagedObjectID {}
@end

@interface _FLBookDetailTag : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLBookDetailTagID* objectID;

@property (nonatomic, strong) FLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLTag *tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;

@end

@interface _FLBookDetailTag (CoreDataGeneratedPrimitiveAccessors)

- (FLBook*)primitiveBook;
- (void)setPrimitiveBook:(FLBook*)value;

- (FLTag*)primitiveTag;
- (void)setPrimitiveTag:(FLTag*)value;

@end
