//
//  YuhuViewController.m
//  Yuhu
//
//  Created by zdk on 12/28/55 BE.
//  Copyright (c) 2555 startisiden. All rights reserved.
//

//#import "YuhuViewController.h"
//
//@interface YuhuViewController ()
//
//@end
//
//@implementation YuhuViewController {
//    NSArray *news;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//    news = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [news count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"NewsCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    cell.textLabel.text = [news objectAtIndex:indexPath.row];
//    return cell;
//}
//
//@end


#import "YuhuViewController.h"
#import "YuhuDetailViewController.h"
#import "BlogRssParser.h"
#import "BlogRss.h"

@implementation YuhuViewController

@synthesize rssParser = _rssParser;
@synthesize tableView = _tableView;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	[super viewDidLoad];
	_rssParser = [[BlogRssParser alloc]init];
	self.rssParser.delegate = self;
	[[self rssParser]startProcess];
}

-(void)reloadRss
{
	[[self rssParser]startProcess];
}


////Delegate method for blog parser will get fired when the process is completed
- (void)processCompleted{
	//reload the table view
	[[self tableView]reloadData];
}

-(void)processHasErrors
{
	//Might be due to Internet
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Rss Fun" message:@"Unable to download rss. Please check if you are connected to internet."
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
	NSLog(@"COUNT: %u ", [[[self rssParser]rssItems]count]);
	return [[[self rssParser]rssItems]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"NewsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
	cell.textLabel.text = [[[[self rssParser]rssItems]objectAtIndex:indexPath.row]title];
	cell.detailTextLabel.text = [[[[self rssParser]rssItems]objectAtIndex:indexPath.row]description];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [self performSegueWithIdentifier:@"showNewsDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"showNewsDetail"] ) { // verify the identifier of segue
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        YuhuDetailViewController *destViewController = segue.destinationViewController;
        NSLog(@"newsLink: %@", [[[[self rssParser]rssItems]objectAtIndex:indexPath.row] linkUrl]);
        destViewController.newsLink = [[[[self rssParser]rssItems]objectAtIndex:indexPath.row] linkUrl];
    }
}

@end

