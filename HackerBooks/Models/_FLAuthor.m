// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLAuthor.m instead.

#import "_FLAuthor.h"

const struct FLAuthorAttributes FLAuthorAttributes = {
	.name = @"name",
};

const struct FLAuthorRelationships FLAuthorRelationships = {
	.booksDetails = @"booksDetails",
};

@implementation FLAuthorID
@end

@implementation _FLAuthor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Authors" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Authors";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Authors" inManagedObjectContext:moc_];
}

- (FLAuthorID*)objectID {
	return (FLAuthorID*)[super objectID];
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

