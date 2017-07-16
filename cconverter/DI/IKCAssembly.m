#import "IKCAssembly.h"

@implementation IKCAssembly

- (IKCAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[IKCAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        SEL rateUpdaterSelector = NSSelectorFromString(@"rateUpdater");
        [definition injectProperty:rateUpdaterSelector with:[self rateUpdater]];
    }];
}


- (IKCCurrencyProvider *)currencyProvider {
    return [TyphoonDefinition withClass:[IKCCurrencyProvider class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}


- (IKCRateProvider *)rateProvider {
    return [TyphoonDefinition withClass:[IKCRateProvider class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}


- (IKCExchangeViewModel *)exchangeViewModel {
    return [TyphoonDefinition withClass:[IKCExchangeViewModel class] configuration:^(TyphoonDefinition *definition) {
        SEL initializerSelector = NSSelectorFromString(@"initWithRateProvider:currencyProvider:");
        [definition useInitializer:initializerSelector parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self rateProvider]];
            [initializer injectParameterWith:[self currencyProvider]];
        }];
    }];
}


- (IKCExchangeController *)exchangeController {
    return [TyphoonDefinition withClass:[IKCExchangeController class] configuration:^(TyphoonDefinition *definition) {
        SEL viewModelSelector = NSSelectorFromString(@"viewModel");
        SEL currencyPurposeSelector = NSSelectorFromString(@"currencyPurpose");
        [definition injectProperty:viewModelSelector with:[self exchangeViewModel]];
        [definition injectProperty:currencyPurposeSelector with:[self currencyPurpose]];
    }];
}


- (IKCCurrencyListViewModel *)currencyListViewModel {
    return [TyphoonDefinition withClass:[IKCCurrencyListViewModel class] configuration:^(TyphoonDefinition *definition) {
        SEL initializerSelector = NSSelectorFromString(@"initWithCurrencyProvider:currencyPurpose:");
        [definition useInitializer:initializerSelector parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self currencyProvider]];
            [initializer injectParameterWith:[self currencyPurpose]];
        }];
    }];
}


- (IKCCurrencyListController *)currencyListController {
    return [TyphoonDefinition withClass:[IKCCurrencyListController class] configuration:^(TyphoonDefinition *definition) {
        SEL viewModelSelector = NSSelectorFromString(@"viewModel");
        [definition injectProperty:viewModelSelector with:[self currencyListViewModel]];
    }];
}


- (IKCCurrencyPurpose *)currencyPurpose {
    return [TyphoonDefinition withClass:[IKCCurrencyPurpose class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeWeakSingleton;
    }];
}

- (IKCRateUpdater *)rateUpdater {
    return [TyphoonDefinition withClass:[IKCRateUpdater class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end
