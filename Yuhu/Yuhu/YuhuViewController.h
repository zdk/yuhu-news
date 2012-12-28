//
//  YuhuViewController.h
//  Yuhu
//
//  Created by zdk on 12/28/55 BE.
//  Copyright (c) 2555 startisiden. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//@interface YuhuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
//
//@end


#import <UIKit/UIKit.h>
#import "BlogRssParser.h"

@class BlogRssParser;
@class BlogRss;

@interface YuhuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,BlogRssParserDelegate> {
	BlogRssParser * _rssParser;
    UITableView * _tableView;
}

@property (nonatomic,retain) IBOutlet BlogRssParser * rssParser;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

