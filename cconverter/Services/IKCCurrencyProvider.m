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

    IKCCurrency *rub = [[IKCCurrency alloc] initWithIdentifier:1 shortName:@"USD" fullName:@"USA Dollar" country:@"USA"];
    IKCCurrency *usd = [[IKCCurrency alloc] initWithIdentifier:2 shortName:@"RUB" fullName:@"Russia Ruble" country:@"Russia"];

    [self setCurrencies:[[NSArray alloc] initWithObjects:rub, usd, nil]];

    return self;
}

@end
