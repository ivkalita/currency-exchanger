//
//  ExchangeController.m
//  cconverter
//
//  Created by Ivan Kalita on 03.07.17.
//  Copyright © 2017 Ivan Kalita. All rights reserved.
//

#import "IKCExchangeController.h"

#import "IKCExchangeViewModel.h"
#import "ReactiveObjC.h"

@interface IKCExchangeController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *sourceCurrencyCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceCurrencyShortNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceCurrencyFullNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *outputField;
@property (weak, nonatomic) IBOutlet UILabel *targetCurrencyCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetCurrencyShortNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetCurrencyFullNameLabel;

@property (strong, nonatomic) IKCExchangeViewModel *viewModel;

@end

@implementation IKCExchangeController

- (IBAction)inputEditingChanged:(id)sender {
    NSNumber *newValue = @(_inputField.text.floatValue);
    [_viewModel setAmount:newValue];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[IKCExchangeViewModel alloc] init];

    [RACObserve(_viewModel, converted) subscribeNext:^(NSNumber *value) {
        _outputField.text = value.stringValue;
    }];

    [RACObserve(_viewModel, sourceCurrencyCountry) subscribeNext:^(NSString *value) {
        _sourceCurrencyCountryLabel.text = value;
    }];

    [RACObserve(_viewModel, sourceCurrencyFullName) subscribeNext:^(NSString *value) {
        _sourceCurrencyFullNameLabel.text = value;
    }];

    [RACObserve(_viewModel, sourceCurrencyShortName) subscribeNext:^(NSString *value) {
        _sourceCurrencyShortNameLabel.text = value;
    }];

    [RACObserve(_viewModel, targetCurrencyCountry) subscribeNext:^(NSString *value) {
        _targetCurrencyCountryLabel.text = value;
    }];

    [RACObserve(_viewModel, targetCurrencyFullName) subscribeNext:^(NSString *value) {
        _targetCurrencyFullNameLabel.text = value;
    }];

    [RACObserve(_viewModel, targetCurrencyShortName) subscribeNext:^(NSString *value) {
        _targetCurrencyShortNameLabel.text = value;
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
