//
//  BlogRss.m
//

#import "YuhuRss.h"


@implementation YuhuRss

@synthesize title = _title;
@synthesize description = _description;
@synthesize linkUrl = _linkUrl;
@synthesize guidUrl = _guidUrl;
@synthesize pubDate = _pubDate;
@synthesize mediaUrl = _mediaUrl;

-(void)dealloc{
	self.title = nil;
	self.description = nil;
	self.linkUrl = nil;
	self.guidUrl = nil;
	self.pubDate = nil;
	self.mediaUrl = nil;
	[super dealloc];
}

@end
