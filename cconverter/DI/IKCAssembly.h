#import "TyphoonAssembly.h"

#import "IKCAppDelegate.h"
#import "IKCCurrencyProvider.h"
#import "IKCRateProvider.h"
#import "IKCExchangeViewModel.h"
#import "IKCExchangeController.h"

@interface IKCAssembly : TyphoonAssembly

- (IKCAppDelegate *)appDelegate;
- (IKCCurrencyProvider *)currencyProvider;
- (IKCRateProvider *)rateProvider;
- (IKCExchangeViewModel *)exchangeViewModel;
- (IKCExchangeController *)exchangeController;

@end
