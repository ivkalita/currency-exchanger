//
//  ExchangeController.m
//  cconverter
//
//  Created by Ivan Kalita on 03.07.17.
//  Copyright © 2017 Ivan Kalita. All rights reserved.
//

#import "IKCExchangeController.h"

@interface IKCExchangeController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextField *outputField;

@end

@implementation IKCExchangeController

- (IBAction)inputEditingChanged:(id)sender {
    float value = _inputField.text.floatValue;
    value *= 60.5;
    _outputField.text = [NSString stringWithFormat:@"%f", value];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
