#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

@interface IKCCurrency : RLMObject

@property(nonatomic) NSString *shortName;
@property(nonatomic) NSString *fullName;
@property(nonatomic) NSString *country;

- (id)initWithShortName:(NSString *)shortName
            fullName:(NSString *)fullName
            country:(NSString *)country;

@end
