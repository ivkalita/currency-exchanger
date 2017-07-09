#import <Foundation/Foundation.h>

#import "IKCCurrency.h"

@interface IKCCurrencyListCellViewModel : NSObject

@property (nonatomic, readonly) NSString *shortName;
@property (nonatomic, readonly) NSString *country;
@property (nonatomic) BOOL selected;

- (id)initWithCurrency:(IKCCurrency *)currency selected:(BOOL)selected;

@end
