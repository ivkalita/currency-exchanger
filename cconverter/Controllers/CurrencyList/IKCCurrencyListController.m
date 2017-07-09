#import "IKCCurrencyListController.h"
#import "IKCCurrencyListViewModel.h"
#import "IKCCurrencyListCellViewModel.h"
#import "IKCCurrencyListCell.h"
#import "IKCCurrencyPurpose.h"

@interface IKCCurrencyListController ()

@property (strong, nonatomic) IKCCurrencyListViewModel *viewModel;

@end

@implementation IKCCurrencyListController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IKCCurrencyListCellViewModel *cellViewModel = [self.viewModel cellViewModelAtIndex:indexPath.row];

    IKCCurrencyListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CurrencyListTableCell"];

    if (cell == nil) {
        cell = [[IKCCurrencyListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CurrencyListTableCell"];
    }

    [cell setViewModel:cellViewModel];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel selectCurrencyAtIndex:indexPath.row];
}

@end
