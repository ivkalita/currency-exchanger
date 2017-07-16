#import "IKCRateUpdater.h"
#import "IKCCurrency.h"
#import "IKCRate.h"

@interface IKCRateUpdater()

@property (strong, nonatomic) dispatch_source_t timer;

@end

@implementation IKCRateUpdater

- (void)run {
    double interval = 60.0;
    dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, 0);
    uint64_t intervalTime = (int64_t)(interval * NSEC_PER_SEC);

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, startTime, intervalTime, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        [self updateRates];
    });

    dispatch_resume(self.timer);
}

- (void)updateRates {
    RLMRealm *realm = RLMRealm.defaultRealm;
    RLMResults *realmCurrencies = [IKCCurrency allObjects];
    NSMutableArray *currencies = [NSMutableArray new];
    for (RLMObject *currency in realmCurrencies) {
        [currencies addObject:currency];
    }
    for (IKCCurrency *source in currencies) {
        NSMutableDictionary *rawRates = [self getCurrencyRates:(IKCCurrency *)source];
        if (!rawRates) {
            continue;
        }
        [realm beginWriteTransaction];
        for (IKCCurrency *target in currencies) {
            NSNumber *rate = @1.0;
            if (target.shortName != source.shortName) {
                rate = [rawRates valueForKey:target.shortName];
            }
            if (rate == nil) {
                continue;
            }
            [IKCRate createInRealm:realm withValue:[[IKCRate alloc] initWithSource:source target:target rate:rate]];
        }
        [realm commitWriteTransaction];
    }
}

- (NSMutableDictionary *)getCurrencyRates:(IKCCurrency *)currency {
    NSError *error;
    NSString *url = [NSString stringWithFormat:@"https://api.fixer.io/latest?base=%@", currency.shortName];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        return nil;
    }
    return [json valueForKey:@"rates"];
}

@end
