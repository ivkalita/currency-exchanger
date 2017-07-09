#import <Foundation/Foundation.h>

#import "IKCRate.h"

@interface IKCExchangeViewModel : NSObject

@property(nonatomic) NSNumber *amount;
@property(nonatomic, readonly) NSNumber *converted;

@property(nonatomic, readonly) NSString *sourceCurrencyShortName;
@property(nonatomic, readonly) NSString *sourceCurrencyFullName;
@property(nonatomic, readonly) NSString *sourceCurrencyCountry;

@property(nonatomic, readonly) NSString *targetCurrencyShortName;
@property(nonatomic, readonly) NSString *targetCurrencyFullName;
@property(nonatomic, readonly) NSString *targetCurrencyCountry;

- (id)init;

@end
