#import "IKCRate.h"

@implementation IKCRate

- (id)initWithSource:(IKCCurrency *)source target:(IKCCurrency *)target rate:(NSNumber *)rate {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    [self setSource:source];
    [self setTarget:target];
    [self setRate:rate];
    [self setCreatedAt:[NSDate date]];

    return self;
}

@end
