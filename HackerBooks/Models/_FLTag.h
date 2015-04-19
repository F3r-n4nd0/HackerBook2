// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLTag.h instead.

@import CoreData;
#import "FLHackerBookBaseClass.h"

extern const struct FLTagAttributes {
	__unsafe_unretained NSString *name;
} FLTagAttributes;

extern const struct FLTagRelationships {
	__unsafe_unretained NSString *booksDetails;
} FLTagRelationships;

@class FLBookDetailTag;

@interface FLTagID : NSManagedObjectID {}
@end

@interface _FLTag : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLTagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *booksDetails;

- (NSMutableSet*)booksDetailsSet;

@end

@interface _FLTag (BooksDetailsCoreDataGeneratedAccessors)
- (void)addBooksDetails:(NSSet*)value_;
- (void)removeBooksDetails:(NSSet*)value_;
- (void)addBooksDetailsObject:(FLBookDetailTag*)value_;
- (void)removeBooksDetailsObject:(FLBookDetailTag*)value_;

@end

@interface _FLTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooksDetails;
- (void)setPrimitiveBooksDetails:(NSMutableSet*)value;

@end
