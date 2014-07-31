//
// Created by azu on 2014/07/23.
//


#import "ShimUIAlertController.h"


@interface ShimUIAlertController ()
@property(nonatomic, readwrite) NSArray *actions;
@property(nonatomic, strong) UIAlertView *alertView;
@property(nonatomic, strong) NSMutableArray *internalActions;
@end

@implementation ShimUIAlertController {

}
- (instancetype)initWithTitle:(NSString *) title message:(NSString *) message preferredStyle:(ShimUIAlertActionStyle) preferredStyle {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    self.title = title;
    self.message = message;
    _preferredStyle = preferredStyle;
    self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    self.alertView.delegate = self;
    self.internalActions = [NSMutableArray array];

    return self;
}

- (id)initWithCoder:(NSCoder *) coder {
    self = [super initWithCoder:coder];
    if (self == nil) {
        return nil;
    }

    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];

    return self;
}

- (void)setTitle:(NSString *) title {
    self.alertView.title = title;
}

- (void)setMessage:(NSString *) message {
    _message = [message mutableCopy];
    self.alertView.message = message;
}

+ (instancetype)alertControllerWithTitle:(NSString *) title message:(NSString *) message preferredStyle:(ShimUIAlertActionStyle) preferredStyle {
    return [[self alloc] initWithTitle:title message:message preferredStyle:preferredStyle];
}

- (void)addAction:(ShimUIAlertAction *) action {
    [self.alertView addButtonWithTitle:action.title];
    [self.internalActions addObject:action.handler];
    self.actions = [self.actions arrayByAddingObject:action];
}

- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField)) configurationHandler {

}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor clearColor];
    [self.alertView show];
}

- (void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
}

- (void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger) buttonIndex {
    void (^callback)(ShimUIAlertAction *action) = self.internalActions[buttonIndex];
    if (callback) {
        callback(self.actions[buttonIndex]);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)alertViewCancel:(UIAlertView *) alertView {
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)showInViewController:(UIViewController *) controller completion:(void (^)()) completion {
    UIModalPresentationStyle original = controller.modalPresentationStyle;
    controller.modalPresentationStyle = UIModalPresentationCurrentContext;
    [controller presentViewController:self animated:NO completion:^{
        controller.modalPresentationStyle = original;
        completion();
    }];
}
@end