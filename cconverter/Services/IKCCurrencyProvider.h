#import <Foundation/Foundation.h>

#import "IKCCurrency.h"

@interface IKCCurrencyProvider : NSObject

@property(nonatomic, readonly) NSArray<IKCCurrency*> *currencies;

@end
