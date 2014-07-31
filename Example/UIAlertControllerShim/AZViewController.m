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
    ShimUIAlertController *controller = [ShimUIAlertController alertControllerWithTitle:@"た行っとる" message:@"message" preferredStyle:ShimUIAlertActionStyleCancel];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [controller addAction:[ShimUIAlertAction actionWithTitle:@"OK" style:ShimUIAlertActionStyleDefault handler:^(ShimUIAlertAction *action) {
        NSLog(@"Cancel");
    }]];
    [controller showInViewController:self completion:^{

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
