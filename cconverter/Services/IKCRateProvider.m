#import "IKCRateProvider.h"

@implementation IKCRateProvider

- (IKCRate *)rateFrom:(IKCCurrency *)from to:(IKCCurrency *)to {
    return [[IKCRate alloc] initWithSource:from target:to rate:@60.5];
}

@end
