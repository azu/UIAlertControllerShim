# UIAlertControllerShim

[![CI Status](http://img.shields.io/travis/azu/UIAlertControllerShim.svg?style=flat)](https://travis-ci.org/azu/UIAlertControllerShim)
[![Version](https://img.shields.io/cocoapods/v/UIAlertControllerShim.svg?style=flat)](http://cocoadocs.org/docsets/UIAlertControllerShim)
[![License](https://img.shields.io/cocoapods/l/UIAlertControllerShim.svg?style=flat)](http://cocoadocs.org/docsets/UIAlertControllerShim)
[![Platform](https://img.shields.io/cocoapods/p/UIAlertControllerShim.svg?style=flat)](http://cocoadocs.org/docsets/UIAlertControllerShim)

## Usage

Compatible layer for [UIAlertController](https://developer.apple.com/library/prerelease/iOS/documentation/UIKit/Reference/UIAlertController_class/ "UIAlertController").

## Known Issue(not compatible things)

- `- (void)showInViewController:(UIViewController *) controller completion:(void (^)()) completion;`
  It's need to set `UIModalPresentationCurrentContext` to controller.
- Close Alert then call `viewDidAppear:`.
  UIAlertController has magical `dismissViewControllerAnimated:`?
- `- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField)) configurationHandler;` is not implement.

## Usage

``` objc
ShimUIAlertController *controller = [ShimUIAlertController alertControllerWithTitle:@"た行っとる" message:@"message" preferredStyle:ShimUIAlertActionStyleCancel];
[controller addAction:[ShimUIAlertAction actionWithTitle:@"OK" style:ShimUIAlertActionStyleDefault handler:^(ShimUIAlertAction *action) {
    NSLog(@"OK");
}]];
[controller showInViewController:self completion:nil];
```

## Installation

UIAlertControllerShim is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "UIAlertControllerShim"

## Author

azu, azuciao@gmail.com

## License

UIAlertControllerShim is available under the MIT license. See the LICENSE file for more info.

