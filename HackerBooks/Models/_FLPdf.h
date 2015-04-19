// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLPdf.h instead.

#import <CoreData/CoreData.h>
#import "FLHackerBookBaseClass.h"

extern const struct FLPdfAttributes {
	__unsafe_unretained NSString *pdfData;
} FLPdfAttributes;

extern const struct FLPdfRelationships {
	__unsafe_unretained NSString *book;
} FLPdfRelationships;

@class FLBook;

@interface FLPdfID : NSManagedObjectID {}
@end

@interface _FLPdf : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLPdfID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _FLPdf (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (FLBook*)primitiveBook;
- (void)setPrimitiveBook:(FLBook*)value;

@end
