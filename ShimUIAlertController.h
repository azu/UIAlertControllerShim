//
// Created by azu on 2014/07/23.
//


#import <Foundation/Foundation.h>
#import "ShimUIAlertAction.h"

@class ShimUIAlertAction;


@interface ShimUIAlertController : UIViewController <UIAlertViewDelegate>

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *message;


@property(nonatomic, readonly) ShimUIAlertActionStyle preferredStyle;

+ (instancetype)alertControllerWithTitle:(NSString *) title message:(NSString *) message preferredStyle:(ShimUIAlertActionStyle) preferredStyle;

- (void)addAction:(ShimUIAlertAction *) action;

@property(nonatomic, readonly) NSArray *actions;

#pragma mark - NOT IMPLEMENT

- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField)) configurationHandler;

@property(nonatomic, readonly) NSArray *textFields;

@end