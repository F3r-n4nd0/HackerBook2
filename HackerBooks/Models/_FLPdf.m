// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLPdf.m instead.

#import "_FLPdf.h"

const struct FLPdfAttributes FLPdfAttributes = {
	.pdfData = @"pdfData",
};

const struct FLPdfRelationships FLPdfRelationships = {
	.book = @"book",
};

@implementation FLPdfID
@end

@implementation _FLPdf

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pdf" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pdf";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pdf" inManagedObjectContext:moc_];
}

- (FLPdfID*)objectID {
	return (FLPdfID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic book;

@end

