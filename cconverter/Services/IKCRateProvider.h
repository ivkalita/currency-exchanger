#import <Foundation/Foundation.h>

#import "IKCRate.h"
#import "IKCCurrency.h"

@interface IKCRateProvider : NSObject

- (IKCRate *)rateFrom:(IKCCurrency *)from to:(IKCCurrency *)to;

@end
