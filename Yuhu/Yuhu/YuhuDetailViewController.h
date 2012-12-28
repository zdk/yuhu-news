//
//  YuhuDetailViewController.h
//  Yuhu
//
//  Created by zdk on 12/28/55 BE.
//  Copyright (c) 2555 startisiden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogRss.h"

@interface YuhuDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *newsLink;

@end
