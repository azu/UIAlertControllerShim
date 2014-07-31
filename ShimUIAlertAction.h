//
// Created by azu on 2014/07/23.
//


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ShimUIAlertActionStyle) {
    ShimUIAlertActionStyleDefault = 0,
    ShimUIAlertActionStyleCancel,
    ShimUIAlertActionStyleDestructive
} NS_ENUM_AVAILABLE_IOS(8_0);


@interface ShimUIAlertAction : NSObject
@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) ShimUIAlertActionStyle style;
@property(nonatomic, getter=isEnabled) BOOL enabled;
@property(nonatomic, copy) void (^handler)(ShimUIAlertAction *);

+ (instancetype)actionWithTitle:(NSString *) title style:(ShimUIAlertActionStyle) style handler:(void (^)(ShimUIAlertAction *action)) handler;

@end