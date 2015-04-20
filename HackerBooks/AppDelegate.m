//
//  AppDelegate.m
//  HackerBooks
//
//  Created by Fernando on 4/19/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "AppDelegate.h"
#import "Settings.h"
#import "FLBook.h"
#import "AGTCoreDataStack.h"
#import "FLBooksTableViewController.h"
#import "FLBookDetailTag.h"
#import "FLTag.h"

#define IS_FIRST_RUN @"IS_FIRST_RUN"
#define IS_LOAD_DATA @"IS_LOAD_DATA"

@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self initWindows];
    [self loadVerifyIsFirstRun];
    [self loadVerifyIsLoadData];
    [self downloadJsonDataAndSaveIfNecessary];
    [self loadFirstViewController];
    return YES;
}

-(void) initWindows {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    UIViewController *vc = [UIViewController new];
    self.window.rootViewController = vc;
}

-(void) loadVerifyIsFirstRun {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:IS_FIRST_RUN]){
        [self setIsFirstRun:FALSE];
    }else{
        [self setIsFirstRun:TRUE];
        [defaults setObject:[NSDate date] forKey:IS_FIRST_RUN];
        [defaults synchronize];
    }
}

-(void) loadVerifyIsLoadData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:IS_LOAD_DATA]){
        [self setIsLoadData:TRUE];
    }else{
        [self setIsLoadData:FALSE];
    }
}

-(void) downloadJsonDataAndSaveIfNecessary {
    if(self.isFirstRun || !self.isLoadData) {
        NSURL *urlJsonDataLibary = [NSURL URLWithString:URL_JSON_DATA];
        [self downloadJsonDataFromURL:urlJsonDataLibary complete:^(NSDictionary *data) {
            [self saveDataInCoreData:data];
        }];
    }
}


- (void) saveDataInCoreData:(NSDictionary*) data{
    for (id bookDictionary in data) {
        if([bookDictionary isKindOfClass:[NSDictionary class]]) {
            [FLBook initWithDictionary:bookDictionary  context:self.stack.context];
        }
    }
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error to save Books in core data : %@",error);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:nil forKey:IS_LOAD_DATA];
        [defaults synchronize];
    }];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSDate date] forKey:IS_LOAD_DATA];
    [defaults synchronize];
}

- (void)downloadJsonDataFromURL:(NSURL*) url complete:(void(^)(NSDictionary* data)) completeBlock {
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if (error) {
                                   NSLog(@"Error read data from url : %@",error);
                                   return;
                               }
                               NSError* errorParseJson;
                               id arrayBooks = [NSJSONSerialization JSONObjectWithData:data
                                                                               options:NSJSONReadingAllowFragments
                                                                                 error:&errorParseJson];
                               if(errorParseJson) {
                                   NSLog(@"Error try to read json data : %@",error);
                                   return;
                               }
                               completeBlock(arrayBooks);
                           }];
    
}


-(void) loadFirstViewController {

    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[FLBookDetailTag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:@"tag.sort"
                             ascending:NO],
                            [NSSortDescriptor
                             sortDescriptorWithKey:@"tag.name"
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor
                             sortDescriptorWithKey:@"book.title"
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)]
                            ];
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:self.stack.context
                                      sectionNameKeyPath:@"tag.name"
                                      cacheName:nil];
    
    FLBooksTableViewController *booksListViewController = [[FLBooksTableViewController alloc] initWithFetchedResultsController:fc style:UITableViewStylePlain];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:booksListViewController];
    [self.window setRootViewController:nvc];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
