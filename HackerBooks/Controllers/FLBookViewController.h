//
//  AGTBookReaderViewController.h
//  HackerBooks
//
//  Created by Fernando on 4/5/15.
//  Copyright (c) 2015 f3rn4nd0. All rights reserved.
//

@import UIKit;
@class FLBook;
@class FLBookViewController;

@interface FLBookViewController : UIViewController <UISplitViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) FLBook* book;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewBookCover;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelAuthors;
@property (weak, nonatomic) IBOutlet UILabel *labelTag;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsFavorite;
@property (weak, nonatomic) IBOutlet UIButton *buttonDownloadAndView;
@property (weak, nonatomic) IBOutlet UITableView *tableViewAnnotations;

-(id) initWithBook:(FLBook*) book;

- (IBAction)addNewNote:(id)sender;


@end
