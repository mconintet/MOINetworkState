## About
Observe network state in Object-C for iOS.

## Usage

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    _label.text = MOINetworkStateText([MOINetworkState currentState]);

    _state = [[MOINetworkState alloc] initWithDidChangeHandler:^(MOINetworkStateCode code) {
        _label.text = MOINetworkStateText(code);
    }];
}
```

## Screenshot

![](https://github.com/mconintet/MOINetworkState/blob/master/screenshot.gif)

## Installation

```
// in your pod file
pod 'MOINetworkState', :git => 'https://github.com/mconintet/MOINetworkState.git'
```

```
// command line
pod install
```