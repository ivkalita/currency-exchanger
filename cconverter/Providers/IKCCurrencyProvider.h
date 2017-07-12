#import <Foundation/Foundation.h>

#import "IKCCurrency.h"

@interface IKCCurrencyProvider : NSObject

@property (nonatomic, readonly) NSArray<IKCCurrency*> *currencies;
@property (nonatomic) IKCCurrency *source;
@property (nonatomic) IKCCurrency *target;

@end
