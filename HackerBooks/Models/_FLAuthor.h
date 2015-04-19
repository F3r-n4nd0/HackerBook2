// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLAuthor.h instead.

@import CoreData;
#import "FLHackerBookBaseClass.h"

extern const struct FLAuthorAttributes {
	__unsafe_unretained NSString *name;
} FLAuthorAttributes;

extern const struct FLAuthorRelationships {
	__unsafe_unretained NSString *booksDetails;
} FLAuthorRelationships;

@class FLBookDetailAuthor;

@interface FLAuthorID : NSManagedObjectID {}
@end

@interface _FLAuthor : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLAuthorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *booksDetails;

- (NSMutableSet*)booksDetailsSet;

@end

@interface _FLAuthor (BooksDetailsCoreDataGeneratedAccessors)
- (void)addBooksDetails:(NSSet*)value_;
- (void)removeBooksDetails:(NSSet*)value_;
- (void)addBooksDetailsObject:(FLBookDetailAuthor*)value_;
- (void)removeBooksDetailsObject:(FLBookDetailAuthor*)value_;

@end

@interface _FLAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooksDetails;
- (void)setPrimitiveBooksDetails:(NSMutableSet*)value;

@end
