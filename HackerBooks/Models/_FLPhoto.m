// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FLPhoto.m instead.

#import "_FLPhoto.h"

const struct FLPhotoAttributes FLPhotoAttributes = {
	.photoData = @"photoData",
	.thumbPhotoData = @"thumbPhotoData",
};

const struct FLPhotoRelationships FLPhotoRelationships = {
	.annotation = @"annotation",
	.book = @"book",
};

@implementation FLPhotoID
@end

@implementation _FLPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (FLPhotoID*)objectID {
	return (FLPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic thumbPhotoData;

@dynamic annotation;

@dynamic book;

@end

