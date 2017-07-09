#import "ReactiveObjC.h"

#import "IKCCurrencyListCell.h"
#import "IKCCurrencyListCellViewModel.h"

@interface IKCCurrencyListCell()

@property (weak, nonatomic) IBOutlet UILabel *shortNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;

@end

@implementation IKCCurrencyListCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    UIColor *color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    [self.contentView.superview setBackgroundColor:color];
}


- (void)setViewModel:(IKCCurrencyListCellViewModel *)viewModel {
    _viewModel = viewModel;

    [RACObserve(_viewModel, shortName) subscribeNext:^(NSString *shortName) {
        [self.shortNameLabel setText:shortName];
    }];

    [RACObserve(_viewModel, country) subscribeNext:^(NSString *country) {
        [self.countryNameLabel setText:country];
    }];

    [RACObserve(_viewModel, selected) subscribeNext:^(id _Nullable __strong something) {
        UITableViewCellAccessoryType accessoryType = _viewModel.selected
            ? UITableViewCellAccessoryCheckmark
            : UITableViewCellAccessoryNone;
        [self setAccessoryType:accessoryType];
    }];
}

@end
