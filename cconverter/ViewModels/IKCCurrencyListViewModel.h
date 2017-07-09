#import <Foundation/Foundation.h>

#import "IKCCurrencyListCellViewModel.h"
#import "IKCCurrencyPurpose.h"

@interface IKCCurrencyListViewModel : NSObject

- (NSInteger)numberOfRowsInSection;
- (IKCCurrencyListCellViewModel *)cellViewModelAtIndex:(NSInteger)index;
- (void)selectCurrencyAtIndex:(NSInteger)index;

@end
