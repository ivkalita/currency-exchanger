#import "IKCCurrencyListViewModel.h"
#import "IKCCurrencyProvider.h"

@interface IKCCurrencyListViewModel()

@property (nonatomic, strong) IKCCurrencyProvider *currencyProvider;
@property (nonatomic, strong) NSMutableDictionary *cellsViewModels;
@property (nonatomic, strong) IKCCurrencyPurpose *currencyPurpose;

- (IKCCurrencyListCellViewModel *)createCellViewModelAtIndex:(NSInteger)index;
- (void)changeCurrencyProviderSelectedCurrency:(NSInteger)index;
- (void)selectCellViewAtIndex:(NSInteger)index;
- (void)deselectCellViews;

@end

@implementation IKCCurrencyListViewModel

- (id)initWithCurrencyProvider:(IKCCurrencyProvider *)currencyProvider currencyPurpose:(IKCCurrencyPurpose *)currencyPurpose {
    self = [super init];

    if (self == nil) {
        return self;
    }

    [self setCurrencyProvider:currencyProvider];
    [self setCellsViewModels:[NSMutableDictionary new]];
    [self setCurrencyPurpose:currencyPurpose];

    return self;
}


- (NSInteger)numberOfRowsInSection {
    return [self.currencyProvider.currencies count];
}


- (IKCCurrencyListCellViewModel *)createCellViewModelAtIndex:(NSInteger)index {
    IKCCurrency *currency = [self.currencyProvider.currencies objectAtIndex:index];
    IKCCurrencyPurposeType purpose = self.currencyPurpose.purpose;
    BOOL selected = purpose == CurrencyPurposeSource
        ? currency == self.currencyProvider.source
        : currency == self.currencyProvider.target;

    IKCCurrencyListCellViewModel *cellViewModel = [[IKCCurrencyListCellViewModel alloc] initWithCurrency:currency selected:selected];

    return cellViewModel;
}


- (IKCCurrencyListCellViewModel *)cellViewModelAtIndex:(NSInteger)index {
    if ([self.cellsViewModels objectForKey:@(index)] == nil) {
        IKCCurrencyListCellViewModel *cellViewModel = [self createCellViewModelAtIndex:index];
        [self.cellsViewModels setObject:cellViewModel forKey:@(index)];
    }

    return [self.cellsViewModels objectForKey:@(index)];
}


- (void)selectCurrencyAtIndex:(NSInteger)index {
    [self changeCurrencyProviderSelectedCurrency:index];
    [self deselectCellViews];
    [self selectCellViewAtIndex:index];
}


- (void)changeCurrencyProviderSelectedCurrency:(NSInteger)index {
    IKCCurrencyProvider *provider = self.currencyProvider;
    IKCCurrencyPurposeType purpose = self.currencyPurpose.purpose;
    IKCCurrency *currency = [self.currencyProvider.currencies objectAtIndex:index];
    if (purpose == CurrencyPurposeTarget) {
        [provider setTarget:currency];
    } else if (purpose == CurrencyPurposeSource){
        [provider setSource:currency];
    }
}


- (void)deselectCellViews {
    for (NSNumber *key in self.cellsViewModels) {
        [[self.cellsViewModels objectForKey:key] setSelected:NO];
    }
}


- (void)selectCellViewAtIndex:(NSInteger)index {
    [[self.cellsViewModels objectForKey:@(index)] setSelected:YES];
}

@end
