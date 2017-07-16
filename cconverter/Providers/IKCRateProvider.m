#import "IKCRateProvider.h"

@implementation IKCRateProvider

- (IKCRate *)rateFrom:(IKCCurrency *)source to:(IKCCurrency *)target {
    return [[[IKCRate objectsWhere:@"source == %@ AND target == %@", source, target] sortedResultsUsingKeyPath:@"createdAt" ascending:NO] firstObject];
}

@end
