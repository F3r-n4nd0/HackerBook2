// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLTag.m instead.

#import "_FLTag.h"

const struct FLTagAttributes FLTagAttributes = {
	.name = @"name",
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

	return keyPaths;
}

@dynamic name;

@dynamic booksDetails;

- (NSMutableSet*)booksDetailsSet {
	[self willAccessValueForKey:@"booksDetails"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"booksDetails"];

	[self didAccessValueForKey:@"booksDetails"];
	return result;
}

@end

