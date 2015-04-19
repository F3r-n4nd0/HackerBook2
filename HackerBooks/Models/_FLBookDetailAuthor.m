// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLBookDetailAuthor.m instead.

#import "_FLBookDetailAuthor.h"

const struct FLBookDetailAuthorRelationships FLBookDetailAuthorRelationships = {
	.author = @"author",
	.book = @"book",
};

@implementation FLBookDetailAuthorID
@end

@implementation _FLBookDetailAuthor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookDetailAuthor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookDetailAuthor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookDetailAuthor" inManagedObjectContext:moc_];
}

- (FLBookDetailAuthorID*)objectID {
	return (FLBookDetailAuthorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic author;

@dynamic book;

@end

