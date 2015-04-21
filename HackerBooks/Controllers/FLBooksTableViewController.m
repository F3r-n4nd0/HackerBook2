//
//  FLBooksTableViewController.m
//  HackerBooks
//
//  Created by Fernando on 4/19/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "FLBooksTableViewController.h"
#import "FLBookDetailTag.h"
#import "FLBook.h"
#import "FLTag.h"
#import "FLBookTableViewCell.h"
#import "FLBookViewController.h"
#import "Settings.h"

@interface FLBooksTableViewController ()

@property (nonatomic) BOOL isLoadLastBookShow;

@end

@implementation FLBooksTableViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"List Books"];
    self.isLoadLastBookShow = YES;
    UINib *nib = [UINib nibWithNibName:@"FLBookTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:[FLBookTableViewCell cellId]];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showLastBookRead];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    FLBookDetailTag *nb = [self.fetchedResultsController
                       objectAtIndexPath:indexPath];

    FLBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FLBookTableViewCell cellId]
                                                                forIndexPath:indexPath];
    
    [cell.labelTitle setText:nb.book.title];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FLBookDetailTag *nb = [self.fetchedResultsController
                           objectAtIndexPath:indexPath];
    [[NSUserDefaults standardUserDefaults] setObject:nb.book.archiveURIRepresentation forKey:KEY_LAST_BOOK_READ];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if ([self.delegate respondsToSelector:@selector(booksTableViewController:disSelectBook:)]) {
        [self.delegate booksTableViewController:self disSelectBook:nb.book];
    }
}


-(void) booksTableViewController:(FLBooksTableViewController*) viewController disSelectBook:(FLBook*) book {
    FLBookViewController *bookView = [[FLBookViewController alloc] initWithBook:book];
    [self.navigationController pushViewController:bookView
                                         animated:YES];
}

-(void)showLastBookRead {
    if(!self.isLoadLastBookShow) {
        return;
    }
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:KEY_LAST_BOOK_READ];
    if(object) {
        FLBook *book = [FLBook objectWithArchivedURIRepresentation:object context:self.fetchedResultsController.managedObjectContext];
        if ([self.delegate respondsToSelector:@selector(booksTableViewController:disSelectBook:)]) {
            [self.delegate booksTableViewController:self disSelectBook:book];
        }
    }
    self.isLoadLastBookShow = NO;
}

@end
