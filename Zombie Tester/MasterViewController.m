//
//  MasterViewController.m
//  Zombie Tester
//
//  Created by Daniel Demiss on 28.12.11.
//  Copyright (c) 2011 CELLULAR GmbH. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController ()

- (NSString *)__titleForIndexPath:(NSIndexPath *)path;

@end


@implementation MasterViewController

@synthesize detailViewController = _detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 23;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

	// Configure the cell.
	cell.textLabel.text = [self __titleForIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIViewController *detail = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];

	detail.title = [self __titleForIndexPath:indexPath];

    [self.navigationController pushViewController:detail animated:YES];

#ifdef DO_NOT_USE_ARC
	[detail release];
#endif
}

- (NSString *)__titleForIndexPath:(NSIndexPath *)path
{
	return 	[NSString stringWithFormat:@"Detail %d", path.row];
}

@end
