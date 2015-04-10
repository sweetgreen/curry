//
//  TKTableViewController.m
//  Created by Devin Ross on 11/19/10.
//
/*
 
 tapku || http://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "TKTableViewController.h"



@interface TKTableViewController () {
@private
	CGPoint _tableViewContentOffset;
	
}
@property (nonatomic,assign) UITableViewStyle style;

@end


#pragma mark - TKTableViewController
@implementation TKTableViewController


// -----------------------------
#pragma mark Init & Friends
- (instancetype) init{
	self = [self initWithStyle:UITableViewStylePlain];
	return self;
}
- (instancetype) initWithStyle:(UITableViewStyle)style{
	if(!(self = [super init])) return nil;
	self.style = style;
	_tableViewContentOffset = CGPointZero;
	_clearsSelectionOnViewWillAppear = YES;
	return self;
}
- (void) dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

// -----------------------------


#pragma mark View Load / Events
- (void) loadView{
	[super loadView];
	
	self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:_style];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.showsVerticalScrollIndicator = YES;
	self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.tableView.contentOffset = _tableViewContentOffset;
	[self.view addSubview:self.tableView];
}
- (void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	if(self.clearsSelectionOnViewWillAppear)
		[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:animated];
}


// -----------------------------
#pragma mark TableView Delegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
	return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
// -----------------------------



// -----------------------------
#pragma mark Properties
- (UISearchBar*) searchBar{
	if(_searchBar) return _searchBar;
	_searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44)];
	_searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	return _searchBar;
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (UISearchDisplayController*) searchBarDisplayController{
	if(_searchBarDisplayController) return _searchBarDisplayController;
	_searchBarDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
	_searchBarDisplayController.delegate = self;
	_searchBarDisplayController.searchResultsDataSource = self;
	_searchBarDisplayController.searchResultsDelegate = self;
	return _searchBarDisplayController;
}
#pragma clang diagnostic pop
// -----------------------------

@end
