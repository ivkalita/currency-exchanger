#import <Foundation/Foundation.h>

@interface IKCCurrency : NSObject

@property(nonatomic) NSInteger identifier;
@property(nonatomic) NSString *shortName;
@property(nonatomic) NSString *fullName;
@property(nonatomic) NSString *country;

- (id)initWithIdentifier:(NSInteger)identifier
            shortName:(NSString *)shortName
            fullName:(NSString *)fullName
            country:(NSString *)country;

@end
