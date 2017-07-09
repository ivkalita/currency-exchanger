#import "ReactiveObjC.h"

#import "IKCExchangeController.h"
#import "IKCExchangeViewModel.h"
#import "IKCAssembly.h"
#import "IKCAppDelegate.h"
#import "IKCCurrencyPurpose.h"

@interface IKCExchangeController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *sourceCurrencyCountryLabel;
@property (weak, nonatomic) IBOutlet UIButton *sourceCurrencyShortNameButton;
@property (weak, nonatomic) IBOutlet UILabel *sourceCurrencyFullNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *outputField;
@property (weak, nonatomic) IBOutlet UILabel *targetCurrencyCountryLabel;
@property (weak, nonatomic) IBOutlet UIButton *targetCurrencyShortNameButton;
@property (weak, nonatomic) IBOutlet UILabel *targetCurrencyFullNameLabel;

@property (strong, nonatomic) IKCExchangeViewModel *viewModel;
@property (strong, nonatomic) IKCCurrencyPurpose *currencyPurpose;

@end

@implementation IKCExchangeController

- (IBAction)inputEditingChanged:(id)sender {
    NSNumber *newValue = @(_inputField.text.floatValue);
    [_viewModel setAmount:newValue];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [RACObserve(_viewModel, converted) subscribeNext:^(NSNumber *value) {
        [_outputField setText:value.stringValue];
    }];

    [RACObserve(_viewModel, sourceCurrencyCountry) subscribeNext:^(NSString *value) {
        [_sourceCurrencyCountryLabel setText:value];
    }];

    [RACObserve(_viewModel, sourceCurrencyFullName) subscribeNext:^(NSString *value) {
        [_sourceCurrencyFullNameLabel setText:value];
    }];

    [RACObserve(_viewModel, sourceCurrencyShortName) subscribeNext:^(NSString *value) {
        [_sourceCurrencyShortNameButton setTitle:value forState:UIControlStateNormal];
    }];

    [RACObserve(_viewModel, targetCurrencyCountry) subscribeNext:^(NSString *value) {
        [_targetCurrencyCountryLabel setText:value];
    }];

    [RACObserve(_viewModel, targetCurrencyFullName) subscribeNext:^(NSString *value) {
        [_targetCurrencyFullNameLabel setText:value];
    }];

    [RACObserve(_viewModel, targetCurrencyShortName) subscribeNext:^(NSString *value) {
        [_targetCurrencyShortNameButton setTitle:value forState:UIControlStateNormal];
    }];

}


- (IBAction)onSourceCurrencyTap:(id)sender {
    [self.currencyPurpose setPurpose:CurrencyPurposeSource];
    [self performSegueWithIdentifier:@"ShowCurrencyList" sender:sender];
}


- (IBAction)onTargetCurrencyTap:(id)sender {
    [self.currencyPurpose setPurpose:CurrencyPurposeTarget];
    [self performSegueWithIdentifier:@"ShowCurrencyList" sender:sender];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
