#import <Foundation/Foundation.h>

@interface IKCExchangeViewModel : NSObject

@property (nonatomic) NSNumber *amount;
@property (nonatomic, readonly) NSAttributedString *amountString;
@property (nonatomic, readonly) NSAttributedString *convertedString;

@property (nonatomic, readonly) NSString *sourceCurrencyShortName;
@property (nonatomic, readonly) NSString *sourceCurrencyFullName;
@property (nonatomic, readonly) NSString *sourceCurrencyCountry;

@property (nonatomic, readonly) NSString *targetCurrencyShortName;
@property (nonatomic, readonly) NSString *targetCurrencyFullName;
@property (nonatomic, readonly) NSString *targetCurrencyCountry;

@end
