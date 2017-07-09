#import "IKCRate.h"

@implementation IKCRate

- (id)initWithSource:(IKCCurrency *)source target:(IKCCurrency *)target rate:(NSNumber *)rate {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    self.source = source;
    self.target = target;
    self.rate = rate;

    return self;
}

@end
