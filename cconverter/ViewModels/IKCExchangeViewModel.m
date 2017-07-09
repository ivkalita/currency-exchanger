#import "ReactiveObjC.h"

#import "IKCExchangeViewModel.h"
#import "IKCCurrency.h"
#import "IKCRateProvider.h"

@interface IKCExchangeViewModel ()

@property(nonatomic) IKCRate *rate;
@property(nonatomic) IKCRateProvider *rateProvider;

@property(nonatomic) NSNumber *converted;

@property(nonatomic) NSString *sourceCurrencyShortName;
@property(nonatomic) NSString *sourceCurrencyFullName;
@property(nonatomic) NSString *sourceCurrencyCountry;

@property(nonatomic) NSString *targetCurrencyShortName;
@property(nonatomic) NSString *targetCurrencyFullName;
@property(nonatomic) NSString *targetCurrencyCountry;


@end

@implementation IKCExchangeViewModel

- (id)init {
    self = [super init];

    if (self == nil) {
        return self;
    }

    [self setAmount:@0];

    IKCCurrency *source = [[IKCCurrency alloc] initWithIdentifier:1 shortName:@"USD" fullName:@"United States of America Dollar" country:@"United States of America"];
    IKCCurrency *target = [[IKCCurrency alloc] initWithIdentifier:2 shortName:@"RUR" fullName:@"Russian Ruble" country:@"Russian Federation"];

    [self setRateProvider:[[IKCRateProvider alloc] init]];
    [self setRate:[self.rateProvider rateFrom:source to:target]];

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
