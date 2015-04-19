// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLBookDetailTag.m instead.

#import "_FLBookDetailTag.h"

const struct FLBookDetailTagRelationships FLBookDetailTagRelationships = {
	.book = @"book",
	.tag = @"tag",
};

@implementation FLBookDetailTagID
@end

@implementation _FLBookDetailTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookDetailTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookDetailTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookDetailTag" inManagedObjectContext:moc_];
}

- (FLBookDetailTagID*)objectID {
	return (FLBookDetailTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic book;

@dynamic tag;

@end

