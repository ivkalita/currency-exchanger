#import "IKCRate.h"

@implementation IKCRate

- (id)initWithSource:(IKCCurrency *)source target:(IKCCurrency *)target rate:(NSNumber *)rate {
    self = [super init];

    [self setSource:source];
    [self setTarget:target];
    [self setRate:rate];
    [self setCreatedAt:[NSDate date]];

    return self;
}

@end
