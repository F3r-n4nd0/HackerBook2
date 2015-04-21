//
//  FLBooksTableViewController.h
//  HackerBooks
//
//  Created by Fernando on 4/19/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class FLBook;
@class FLBooksTableViewController;

@protocol FLBooksTableViewControllerDelegate <NSObject>

-(void) booksTableViewController:(FLBooksTableViewController*) viewController disSelectBook:(FLBook*) book;

@end

@interface FLBooksTableViewController : AGTCoreDataTableViewController <FLBooksTableViewControllerDelegate>
@property (weak, nonatomic) id<FLBooksTableViewControllerDelegate> delegate;

@end
