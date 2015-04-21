// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLBook.h instead.

@import CoreData;
#import "FLHackerBookBaseClass.h"

extern const struct FLBookAttributes {
	__unsafe_unretained NSString *coverURL;
	__unsafe_unretained NSString *pdfURL;
	__unsafe_unretained NSString *title;
} FLBookAttributes;

extern const struct FLBookRelationships {
	__unsafe_unretained NSString *annotations;
	__unsafe_unretained NSString *authorsDetails;
	__unsafe_unretained NSString *cover;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *tagsDetails;
} FLBookRelationships;

@class FLAnnotation;
@class FLBookDetailAuthor;
@class FLPhoto;
@class FLPdf;
@class FLBookDetailTag;

@interface FLBookID : NSManagedObjectID {}
@end

@interface _FLBook : FLHackerBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FLBookID* objectID;

@property (nonatomic, strong) NSString* coverURL;

//- (BOOL)validateCoverURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@property (nonatomic, strong) NSSet *authorsDetails;

- (NSMutableSet*)authorsDetailsSet;

@property (nonatomic, strong) FLPhoto *cover;

//- (BOOL)validateCover:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FLPdf *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tagsDetails;

- (NSMutableSet*)tagsDetailsSet;

@end

@interface _FLBook (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(FLAnnotation*)value_;
- (void)removeAnnotationsObject:(FLAnnotation*)value_;

@end

@interface _FLBook (AuthorsDetailsCoreDataGeneratedAccessors)
- (void)addAuthorsDetails:(NSSet*)value_;
- (void)removeAuthorsDetails:(NSSet*)value_;
- (void)addAuthorsDetailsObject:(FLBookDetailAuthor*)value_;
- (void)removeAuthorsDetailsObject:(FLBookDetailAuthor*)value_;

@end

@interface _FLBook (TagsDetailsCoreDataGeneratedAccessors)
- (void)addTagsDetails:(NSSet*)value_;
- (void)removeTagsDetails:(NSSet*)value_;
- (void)addTagsDetailsObject:(FLBookDetailTag*)value_;
- (void)removeTagsDetailsObject:(FLBookDetailTag*)value_;

@end

@interface _FLBook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCoverURL;
- (void)setPrimitiveCoverURL:(NSString*)value;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

- (NSMutableSet*)primitiveAuthorsDetails;
- (void)setPrimitiveAuthorsDetails:(NSMutableSet*)value;

- (FLPhoto*)primitiveCover;
- (void)setPrimitiveCover:(FLPhoto*)value;

- (FLPdf*)primitivePdf;
- (void)setPrimitivePdf:(FLPdf*)value;

- (NSMutableSet*)primitiveTagsDetails;
- (void)setPrimitiveTagsDetails:(NSMutableSet*)value;

@end
