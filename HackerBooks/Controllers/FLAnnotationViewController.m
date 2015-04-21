//
//  FLAnnotationViewController.m
//  HackerBooks
//
//  Created by Fernando on 4/21/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "FLAnnotationViewController.h"

@interface FLAnnotationViewController ()

@end

@implementation FLAnnotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.viewBackground.layer setCornerRadius:5];
//    [self.viewBackground.layer setBorderColor:[[UIColor blackColor] CGColor]];
//    [self.viewBackground.layer setBorderWidth:2];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneAnnotation:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
