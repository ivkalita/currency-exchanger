#import "IKCCurrencyProvider.h"

@interface IKCCurrencyProvider()

@property(nonatomic) NSArray<IKCCurrency*> *currencies;

@end

@implementation IKCCurrencyProvider

- (id)init {
    self = [super init];

    if (self == nil) {
        return self;
    }

    [self refreshCurrencies];
    [self setSource:self.currencies[0]];
    [self setTarget:self.currencies[1]];

    return self;
}

- (void)refreshCurrencies {
    RLMResults *results = [IKCCurrency allObjects];
    NSMutableArray *currencies = [NSMutableArray new];
    for (RLMObject *object in results) {
        [currencies addObject:object];
    }
    [self setCurrencies:currencies];
}

@end
