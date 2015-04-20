// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLTag.m instead.

#import "_FLTag.h"

const struct FLTagAttributes FLTagAttributes = {
	.name = @"name",
	.sort = @"sort",
};

const struct FLTagRelationships FLTagRelationships = {
	.booksDetails = @"booksDetails",
};

@implementation FLTagID
@end

@implementation _FLTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (FLTagID*)objectID {
	return (FLTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"sortValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sort"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic name;

@dynamic sort;

- (int16_t)sortValue {
	NSNumber *result = [self sort];
	return [result shortValue];
}

- (void)setSortValue:(int16_t)value_ {
	[self setSort:@(value_)];
}

- (int16_t)primitiveSortValue {
	NSNumber *result = [self primitiveSort];
	return [result shortValue];
}

- (void)setPrimitiveSortValue:(int16_t)value_ {
	[self setPrimitiveSort:@(value_)];
}

@dynamic booksDetails;

- (NSMutableSet*)booksDetailsSet {
	[self willAccessValueForKey:@"booksDetails"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"booksDetails"];

	[self didAccessValueForKey:@"booksDetails"];
	return result;
}

@end

