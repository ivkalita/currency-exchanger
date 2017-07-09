#import "ReactiveObjC.h"

#import "IKCExchangeViewModel.h"
#import "IKCCurrency.h"
#import "IKCRate.h"
#import "IKCRateProvider.h"
#import "IKCCurrencyProvider.h"

@interface IKCExchangeViewModel ()

@property(nonatomic) IKCRate *rate;
@property(nonatomic) IKCRateProvider *rateProvider;
@property(nonatomic) IKCCurrencyProvider *currencyProvider;

@property(nonatomic) NSNumber *converted;

@property(nonatomic) NSString *sourceCurrencyShortName;
@property(nonatomic) NSString *sourceCurrencyFullName;
@property(nonatomic) NSString *sourceCurrencyCountry;

@property(nonatomic) NSString *targetCurrencyShortName;
@property(nonatomic) NSString *targetCurrencyFullName;
@property(nonatomic) NSString *targetCurrencyCountry;

@end

@implementation IKCExchangeViewModel

- (id)initWithRateProvider:(IKCRateProvider *)rateProvider currencyProvider:(IKCCurrencyProvider *)currencyProvider {
    self = [super init];

    if (self == nil) {
        return self;
    }

    [self setRateProvider:rateProvider];
    [self setCurrencyProvider:currencyProvider];

    [self setRate:[self.rateProvider rateFrom:currencyProvider.currencies[0] to:currencyProvider.currencies[1]]];
    [RACObserve(self, rate) subscribeNext:^(IKCRate *rate) {
        [self setAmount:self.amount];
    }];

    [self setAmount:@0];

    return self;
}

- (void)setAmount:(NSNumber *)amount {
    _amount = amount;
    NSNumber *newConverted = _rate == nil
        ? @0
        : @(_rate.rate.doubleValue * _amount.doubleValue);
    [self setConverted:newConverted];
}

- (void)setRate:(IKCRate *)rate {
    _rate = rate;

    if (rate == nil) {
        return;
    }

    IKCCurrency *source = rate.source;
    [self setSourceCurrencyCountry:source.country];
    [self setSourceCurrencyShortName:source.shortName];
    [self setSourceCurrencyFullName:source.fullName];

    IKCCurrency *target = rate.target;
    [self setTargetCurrencyCountry:target.country];
    [self setTargetCurrencyShortName:target.shortName];
    [self setTargetCurrencyFullName:target.fullName];
}

@end
