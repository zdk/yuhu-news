//
//  YuhuDetailViewController.m
//  Yuhu
//
//  Created by zdk on 12/28/55 BE.
//  Copyright (c) 2555 startisiden. All rights reserved.
//

#import "YuhuDetailViewController.h"

@interface YuhuDetailViewController ()

@end

@implementation YuhuDetailViewController

@synthesize webView;
@synthesize newsLink;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Go to: %@", newsLink);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:newsLink]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
