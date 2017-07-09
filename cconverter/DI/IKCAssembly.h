#import "TyphoonAssembly.h"

#import "IKCAppDelegate.h"
#import "IKCCurrencyProvider.h"
#import "IKCRateProvider.h"
#import "IKCCurrencyPurpose.h"

#import "IKCExchangeViewModel.h"
#import "IKCExchangeController.h"

#import "IKCCurrencyListViewModel.h"
#import "IKCCurrencyListController.h"

@interface IKCAssembly : TyphoonAssembly

- (IKCAppDelegate *)appDelegate;
- (IKCCurrencyProvider *)currencyProvider;
- (IKCRateProvider *)rateProvider;
- (IKCExchangeViewModel *)exchangeViewModel;
- (IKCExchangeController *)exchangeController;
- (IKCCurrencyListViewModel *)currencyListViewModel;
- (IKCCurrencyListController *)currencyListController;
- (IKCCurrencyPurpose *)currencyPurpose;

@end
