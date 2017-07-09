#import <Foundation/Foundation.h>

#import "IKCCurrency.h"

@interface IKCRate : NSObject

@property(nonatomic) IKCCurrency *source;
@property(nonatomic) IKCCurrency *target;
@property(nonatomic) NSNumber *rate;

- (id)initWithSource:(IKCCurrency *)source target:(IKCCurrency *)target rate:(NSNumber *)rate;

@end
