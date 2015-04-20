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

@implementation FLBooksTableViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"List Books"];
    UINib *nib = [UINib nibWithNibName:@"FLBookTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:[FLBookTableViewCell cellId]];
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

@end
