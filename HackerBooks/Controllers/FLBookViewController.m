//
//  AGTBookReaderViewController.m
//  HackerBooks
//
//  Created by Fernando on 4/5/15.
//  Copyright (c) 2015 f3rn4nd0. All rights reserved.
//

//#import <Reader/ReaderViewController.h>

#import "FLBookViewController.h"
#import "FLBook.h"
#import "FLTag.h"
#import "FLBookDetailTag.h"
#import "Settings.h"
#import "FLAnnotation.h"
#import "FLAnnotationViewController.h"

@interface FLBookViewController()

@property (nonatomic, strong) NSFetchedResultsController *fetchAnnotations;

@end

@implementation FLBookViewController


-(id) initWithBook:(FLBook*)book {
    if(self = [self init]) {
        _book = book;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"BOOK"];
    [self updateDataBook];
    self.navigationController.navigationBar.translucent = NO;
    [self loadAnnotations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)updateDataBook {
    
    
    if(self.book.imageCover)
        [self.imageViewBookCover setImage:self.book.imageCover];
    else
        [self downloadImageFromURL:self.book.imageURLCover book:self.book];

    [self.labelTitle setText:self.book.title];
    [self.labelAuthors setText:self.book.authorsDescription];
    [self.labelTag setText:self.book.tagsDescription];
    [self.switchIsFavorite setOn:self.book.isFavorite animated:YES];
    //    if([self.book isPdfDownloaded]){
    //        [self.buttonDownloadAndView setTitle:@"VIEW" forState:UIControlStateNormal];
    //    } else {
    //        [self.buttonDownloadAndView setTitle:@"DOWNLOAD" forState:UIControlStateNormal];
    //    }
}
         
-(void)downloadImageFromURL:(NSURL*) url book:(FLBook*) book {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0),
                   ^{
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       [book addCoverWithData:data];
                       dispatch_async(dispatch_get_main_queue(), ^{
                           [weakSelf.imageViewBookCover setImage:[UIImage imageWithData:data]];
                       });
                   });
    
}


#pragma mark - events views

- (IBAction)changeSwitchIsFavorite:(UISwitch *)sender {
    if(sender.isOn) {
        [self.book addToFavorites];
    } else {
        [self.book removeToFavorites];
    }
}

- (IBAction)clickButtonViewOrDownload:(UIButton *)sender {
    //    if([self.book isPdfDownloaded]){
    //        ReaderDocument* readerDocument = [[ReaderDocument alloc] initWithFilePath:[self.book downloadPdf] password:nil];
    //        ReaderViewController* readerViewController = [[ReaderViewController alloc] initWithReaderDocument:readerDocument];
    //        [self.navigationController pushViewController:readerViewController animated:YES];
    //    } else {
    //        [self.book downloadPdf];
    //    }
}


#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    // Averiguar si la tabla se ve o no
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        // La tabla está oculta y cuelga del botón
        // Ponemos ese botón en mi barra de navegación
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }else{
        // Se muestra la tabla: oculto el botón de la
        // barra de navegación
        self.navigationItem.leftBarButtonItem = nil;
    }
}


-(void)loadAnnotations {
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[FLAnnotation entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:FLAnnotationAttributes.creationDate
                             ascending:YES]
                            ];
    req.predicate = [NSPredicate predicateWithFormat:@"book = %@",self.book];
    
    self.fetchAnnotations = [[NSFetchedResultsController alloc]
                            initWithFetchRequest:req
                            managedObjectContext:self.book.managedObjectContext
                            sectionNameKeyPath:nil
                            cacheName:nil];
    
    NSError *error;
    [self.fetchAnnotations performFetch:&error];
    if(error) {
        NSLog(@"Error to fetch Annotations : %@",error);
    }
    [self.tableViewAnnotations reloadData];
    
}


#pragma mark - TableView 

#pragma mark - CollectionView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchAnnotations sections] count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchAnnotations sections][section];
    return [sectionInfo numberOfObjects];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLAnnotation *annotation = [self.fetchAnnotations
                           objectAtIndexPath:indexPath];
    NSString *cellIdentifier = @"AnnoationCell";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.textLabel setText:annotation.text];
    return cell;
}


- (IBAction)addNewNote:(id)sender {
    FLAnnotationViewController *vc = [[FLAnnotationViewController alloc] init];
    [self.navigationController presentViewController:vc animated:YES completion:^{
        
    }];
    
    

//    [FLAnnotation noteWithName:@"Annotacion" notebook:self.book context:self.book.managedObjectContext];
//    NSError *error;
//    [self.book.managedObjectContext save:&error];
//    if(error) {
//        NSLog(@"error save annotation : %@",error);
//    }
}


-(void)hideAnnotation {
    
}

@end
