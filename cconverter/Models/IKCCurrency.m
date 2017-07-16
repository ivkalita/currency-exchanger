#import "IKCCurrency.h"

@implementation IKCCurrency

- (id)initWithShortName:(NSString *)shortName fullName:(NSString *)fullName country:(NSString *)country {
    self = [super init];

    self.shortName = shortName;
    self.fullName = fullName;
    self.country = country;

    return self;
}

@end
