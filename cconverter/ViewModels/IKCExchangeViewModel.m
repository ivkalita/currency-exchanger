#import "ReactiveObjC.h"

#import "IKCExchangeViewModel.h"
#import "IKCRateProvider.h"
#import "IKCCurrencyProvider.h"

@interface IKCExchangeViewModel ()

@property (nonatomic) IKCRate *rate;
@property (strong, nonatomic) IKCRateProvider *rateProvider;
@property (strong, nonatomic) IKCCurrencyProvider *currencyProvider;
@property (nonatomic) NSString *updatedAt;

@property (nonatomic) NSAttributedString *amountString;
@property (nonatomic) NSNumber *converted;
@property (nonatomic) NSAttributedString *convertedString;

@property (nonatomic) NSString *sourceCurrencyShortName;
@property (nonatomic) NSString *sourceCurrencyFullName;
@property (nonatomic) NSString *sourceCurrencyCountry;

@property (nonatomic) NSString *targetCurrencyShortName;
@property (nonatomic) NSString *targetCurrencyFullName;
@property (nonatomic) NSString *targetCurrencyCountry;

@property (nonatomic) NSDateFormatter *formatter;

- (void)setupAmountString:(NSNumber *)amount;
- (void)setupConvertedString:(NSNumber *)converted;

@end

@implementation IKCExchangeViewModel

- (id)initWithRateProvider:(IKCRateProvider *)rateProvider currencyProvider:(IKCCurrencyProvider *)currencyProvider {
    self = [super init];

    if (self == nil) {
        return self;
    }


    self.formatter = [NSDateFormatter new];
    [self.formatter setDateFormat:@"MM-dd-yyyy HH:mm"];

    [self setRateProvider:rateProvider];
    [self setCurrencyProvider:currencyProvider];

    [RACObserve(_currencyProvider, source) subscribeNext:^(IKCCurrency *currency) {
        [self updateRate];
    }];
    [RACObserve(_currencyProvider, target) subscribeNext:^(IKCCurrency *currency) {
        [self updateRate];
    }];
    [RACObserve(self, rate) subscribeNext:^(IKCRate *rate) {
        [self setAmount:self.amount];
    }];
    [RACObserve(self, converted) subscribeNext:^(NSNumber *converted) {
        [self setupConvertedString:converted];
    }];

    [self setAmount:@0];

    return self;
}


- (void)updateRate {
    [self setRate:[self.rateProvider rateFrom:self.currencyProvider.source to:self.currencyProvider.target]];
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

    NSString *dateString = [self.formatter stringFromDate:rate.createdAt];
    [self setUpdatedAt:[NSString stringWithFormat:@"Rates are of %@", dateString]];
}


- (void)setAmount:(NSNumber *)amount {
    _amount = amount;
    NSNumber *newConverted = _rate == nil
        ? @0
        : @(_rate.rate.doubleValue * _amount.doubleValue);
    [self setConverted:newConverted];
}


- (void)setupAmountString:(NSNumber *)amount {
    amount = amount == nil ? @0 : amount;
    NSString *str = [NSString stringWithFormat:@"%.02f", amount.doubleValue];
    [self setAmountString:[[NSAttributedString alloc] initWithString:str]];
}


- (void)setupConvertedString:(NSNumber *)converted {
    converted = converted == nil ? @0 : converted;
    NSString *str = [NSString stringWithFormat:@"%.02f", converted.doubleValue];
    [self setConvertedString:[[NSAttributedString alloc] initWithString:str]];
}

@end
