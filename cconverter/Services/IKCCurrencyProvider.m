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

    NSArray *rawCurrencies = @[
                               @[@"USD", @"USA Dollar", @"USA"],
                               @[@"RUB", @"Russian Ruble", @"Russian Federation"],
                               @[@"AUD", @"Australian Dollar", @"Australia"],
                               @[@"BGN", @"Bulgarian Lev", @"Bulgaria"],
                               @[@"EUR", @"Euro", @"Euro Member Countries"],
                               @[@"GBP", @"British Pound", @"United Kingdom"]
                            ];
    NSMutableArray *currencies = [NSMutableArray new];
    [rawCurrencies enumerateObjectsUsingBlock:^(NSArray *value, NSUInteger idx, BOOL * _Nonnull stop) {
        IKCCurrency *currency = [[IKCCurrency alloc] initWithIdentifier:idx shortName:value[0] fullName:value[1] country:value[2]];
        [currencies addObject:currency];
    }];

    [self setCurrencies:currencies];
    [self setSource:self.currencies[0]];
    [self setTarget:self.currencies[1]];

    return self;
}

@end
