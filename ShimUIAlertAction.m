//
// Created by azu on 2014/07/23.
//


#import "ShimUIAlertAction.h"


@implementation ShimUIAlertAction {

}
- (instancetype)initWithTitle:(NSString *) title style:(ShimUIAlertActionStyle) style handler:(void (^)(ShimUIAlertAction *)) handler {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _title = title;
    _style = style;
    self.handler = handler;
    return self;
}

+ (instancetype)actionWithTitle:(NSString *) title style:(ShimUIAlertActionStyle) style handler:(void (^)(ShimUIAlertAction *action)) handler {
    return [[self alloc] initWithTitle:title style:style handler:handler];
}

@end