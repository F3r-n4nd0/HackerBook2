// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLBook.m instead.

#import "_FLBook.h"

const struct FLBookAttributes FLBookAttributes = {
	.coverURL = @"coverURL",
	.pdfURL = @"pdfURL",
	.title = @"title",
};

const struct FLBookRelationships FLBookRelationships = {
	.annotations = @"annotations",
	.authorsDetails = @"authorsDetails",
	.cover = @"cover",
	.pdf = @"pdf",
	.tagsDetails = @"tagsDetails",
};

@implementation FLBookID
@end

@implementation _FLBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (FLBookID*)objectID {
	return (FLBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic coverURL;

@dynamic pdfURL;

@dynamic title;

@dynamic annotations;

- (NSMutableSet*)annotationsSet {
	[self willAccessValueForKey:@"annotations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotations"];

	[self didAccessValueForKey:@"annotations"];
	return result;
}

@dynamic authorsDetails;

- (NSMutableSet*)authorsDetailsSet {
	[self willAccessValueForKey:@"authorsDetails"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"authorsDetails"];

	[self didAccessValueForKey:@"authorsDetails"];
	return result;
}

@dynamic cover;

@dynamic pdf;

@dynamic tagsDetails;

- (NSMutableSet*)tagsDetailsSet {
	[self willAccessValueForKey:@"tagsDetails"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tagsDetails"];

	[self didAccessValueForKey:@"tagsDetails"];
	return result;
}

@end

