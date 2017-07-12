#import "IKCRateProvider.h"

@implementation IKCRateProvider

- (IKCRate *)rateFrom:(IKCCurrency *)source to:(IKCCurrency *)target {
    return [[IKCRate alloc] initWithSource:source target:target rate:@60.5];
}

@end
