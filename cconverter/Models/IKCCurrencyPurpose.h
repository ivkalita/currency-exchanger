#import <Foundation/Foundation.h>

typedef enum {
    CurrencyPurposeSource,
    CurrencyPurposeTarget
} IKCCurrencyPurposeType;

@interface IKCCurrencyPurpose : NSObject

@property (nonatomic) IKCCurrencyPurposeType purpose;

@end
