#import <Foundation/Foundation.h>

#import "IKCRate.h"
#import "IKCCurrency.h"

@interface IKCRateProvider : NSObject

- (IKCRate *)rateFrom:(IKCCurrency *)source to:(IKCCurrency *)target;

@end
