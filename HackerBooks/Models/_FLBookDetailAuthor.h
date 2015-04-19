// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLBookDetailAuthor.h instead.

@import CoreData;
#import "FLHackerBookBaseClass.h"

extern const struct FLBookDetailAuthorRelationships {
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *book;
} FLBookDetailAuthorRelationships;

@class FLAuthor;
@class FLBook;

@interface FLBookDetailAuthorID : NSManagedObjectID {}
@end

@interface _FLBookDetailAuthor : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLBookDetailAuthorID* objectID;

@property (nonatomic, strong) FLAuthor *author;

//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _FLBookDetailAuthor (CoreDataGeneratedPrimitiveAccessors)

- (FLAuthor*)primitiveAuthor;
- (void)setPrimitiveAuthor:(FLAuthor*)value;

- (FLBook*)primitiveBook;
- (void)setPrimitiveBook:(FLBook*)value;

@end
