#import "IKCCurrencyListCellViewModel.h"

@interface IKCCurrencyListCellViewModel()

@property (nonatomic) NSString *shortName;
@property (nonatomic) NSString *country;
@property (nonatomic) IKCCurrency *currency;

@end

@implementation IKCCurrencyListCellViewModel

- (id)initWithCurrency:(IKCCurrency *)currency selected:(BOOL)selected {
    self = [super init];
    if (self == nil) {
        return self;
    }

    [self setCurrency:currency];
    [self setSelected:selected];

    return self;
}


- (void)setCurrency:(IKCCurrency *)currency {
    [self setShortName:currency.shortName];
    [self setCountry:currency.country];
}

@end
