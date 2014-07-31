//
//  AZViewController.m
//  UIAlertControllerShim
//
//  Created by azu on 07/31/2014.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import "AZViewController.h"
#import "ShimUIAlertController.h"

@interface AZViewController ()

@end

@implementation AZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL) animated {
    [super viewDidAppear:animated];
    ShimUIAlertController *controller = [ShimUIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:ShimUIAlertActionStyleCancel];
    [controller addAction:[ShimUIAlertAction actionWithTitle:@"OK" style:ShimUIAlertActionStyleDefault handler:^(ShimUIAlertAction *action) {
        NSLog(@"OK");
    }]];
    [controller showInViewController:self completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
