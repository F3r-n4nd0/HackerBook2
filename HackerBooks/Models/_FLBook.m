// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLBook.m instead.

#import "_FLBook.h"

const struct FLBookAttributes FLBookAttributes = {
	.coverURL = @"coverURL",
	.isFavorite = @"isFavorite",
	.pdfURL = @"pdfURL",
	.title = @"title",
};

const struct FLBookRelationships FLBookRelationships = {
	.annotations = @"annotations",
	.authorsDetails = @"authorsDetails",
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

	if ([key isEqualToString:@"isFavoriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFavorite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic coverURL;

@dynamic isFavorite;

- (BOOL)isFavoriteValue {
	NSNumber *result = [self isFavorite];
	return [result boolValue];
}

- (void)setIsFavoriteValue:(BOOL)value_ {
	[self setIsFavorite:@(value_)];
}

- (BOOL)primitiveIsFavoriteValue {
	NSNumber *result = [self primitiveIsFavorite];
	return [result boolValue];
}

- (void)setPrimitiveIsFavoriteValue:(BOOL)value_ {
	[self setPrimitiveIsFavorite:@(value_)];
}

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

@dynamic pdf;

@dynamic tagsDetails;

- (NSMutableSet*)tagsDetailsSet {
	[self willAccessValueForKey:@"tagsDetails"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tagsDetails"];

	[self didAccessValueForKey:@"tagsDetails"];
	return result;
}

@end

