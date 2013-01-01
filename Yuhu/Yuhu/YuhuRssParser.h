//
//  BlogRssParser.h
//

#import <Foundation/Foundation.h>

@class YuhuRss;

@protocol BlogRssParserDelegate;

@interface YuhuRssParser : NSObject {
	YuhuRss * _currentItem;
	NSMutableString * _currentItemValue;
	NSMutableArray * _rssItems;
	id<BlogRssParserDelegate> _delegate;
	NSOperationQueue *_retrieverQueue;
}


@property(nonatomic, retain) YuhuRss * currentItem;
@property(nonatomic, retain) NSMutableString * currentItemValue;
@property(readonly) NSMutableArray * rssItems;

@property(nonatomic, assign) id<BlogRssParserDelegate> delegate;
@property(nonatomic, retain) NSOperationQueue *retrieverQueue;

- (void)startProcess;

@end

@protocol BlogRssParserDelegate <NSObject>

-(void)processCompleted;
-(void)processHasErrors;

@end
