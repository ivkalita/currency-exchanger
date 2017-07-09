#import "IKCCurrency.h"

@implementation IKCCurrency

- (id)initWithIdentifier:(NSInteger)identifier shortName:(NSString *)shortName fullName:(NSString *)fullName country:(NSString *)country {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    self.identifier = identifier;
    self.shortName = shortName;
    self.fullName = fullName;
    self.country = country;

    return self;
}

@end
