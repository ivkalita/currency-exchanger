#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

#import "IKCCurrency.h"

@interface IKCRate : RLMObject

@property(nonatomic) IKCCurrency *source;
@property(nonatomic) IKCCurrency *target;
@property(nonatomic) NSNumber<RLMDouble> *rate;
@property(nonatomic) NSDate *createdAt;

- (id)initWithSource:(IKCCurrency *)source target:(IKCCurrency *)target rate:(NSNumber *)rate;

@end
