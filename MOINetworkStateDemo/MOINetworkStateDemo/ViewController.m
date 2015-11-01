//
//  ViewController.m
//  MOINetworkStateDemo
//
//  Created by mconintet on 10/29/15.
//  Copyright © 2015 mconintet. All rights reserved.
//

#import "ViewController.h"
#import "MOINetworkState.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel* label;
@property (nonatomic, strong) MOINetworkState* state;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _label.text = MOINetworkStateText([MOINetworkState currentState]);

    _state = [[MOINetworkState alloc] initWithDidChangeHandler:^(MOINetworkStateCode code) {
        _label.text = MOINetworkStateText(code);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
