//
//  EaseRefreshTableViewController.m
//  ChatDemo-UI3.0
//
//  Created by dhc on 15/6/24.
//  Copyright (c) 2015年 easemob.com. All rights reserved.
//

#import "EaseRefreshTableViewController.h"

//#import "MJRefresh.h"

@interface EaseRefreshTableViewController ()

@property (nonatomic, readonly) UITableViewStyle style;

@end

@implementation EaseRefreshTableViewController

@synthesize rightItems = _rightItems;

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
  
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
   
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout =  UIRectEdgeNone;
    }
    

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:self.style];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = self.defaultFooterView;
    [self.view addSubview:_tableView];
    
    _page = 0;
    _showRefreshHeader = NO;
    _showRefreshFooter = NO;
    _showTableBlankView = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    if (_showRefreshHeader != showRefreshHeader) {
        _showRefreshHeader = showRefreshHeader;
        if (_showRefreshHeader) {
             //6.26 xiong
//            __weak EaseRefreshTableViewController *weakSelf = self;
//            self.tableView.mj_header = [MJChiBaoZiHeader headerWithRefreshingBlock:^{
//                [weakSelf tableViewDidTriggerHeaderRefresh];
//                [weakSelf.tableView.mj_header beginRefreshing];
//            }];
          
        }
        else{
        
        }
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    if (_showRefreshFooter != showRefreshFooter) {
        _showRefreshFooter = showRefreshFooter;
        if (_showRefreshFooter) {
             //6.26 xiong
//            __weak EaseRefreshTableViewController *weakSelf = self;
            //6.26 xiong
//            self.tableView.mj_footer = [MJChiBaoZiFooter footerWithRefreshingBlock:^{
//                [weakSelf tableViewDidTriggerFooterRefresh];
//                [weakSelf.tableView.mj_footer beginRefreshing];
//            }];
        }
        else{
           
        }
    }
}

- (void)setShowTableBlankView:(BOOL)showTableBlankView
{
    if (_showTableBlankView != showTableBlankView) {
        _showTableBlankView = showTableBlankView;
    }
}

#pragma mark - getter

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (NSMutableDictionary *)dataDictionary
{
    if (_dataDictionary == nil) {
        _dataDictionary = [NSMutableDictionary dictionary];
    }
    
    return _dataDictionary;
}

- (UIView *)defaultFooterView
{
    if (_defaultFooterView == nil) {
        _defaultFooterView = [[UIView alloc] init];
    }
    
    return _defaultFooterView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return KCELLDEFAULTHEIGHT;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - public refresh

- (void)autoTriggerHeaderRefresh
{
    if (self.showRefreshHeader) {
        [self tableViewDidTriggerHeaderRefresh];
    }
}

/**
 *  下拉刷新事件
 */
- (void)tableViewDidTriggerHeaderRefresh
{
    
}

/**
 *  上拉加载事件
 */
- (void)tableViewDidTriggerFooterRefresh
{
    
}

- (void)tableViewDidFinishTriggerHeader:(BOOL)isHeader reload:(BOOL)reload
{
    __weak EaseRefreshTableViewController *weakSelf = self;

   
        if (isHeader) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        else{
            [weakSelf.tableView.mj_footer endRefreshing];
        }

}
//-(BOOL)isTableViewDown
//{
//    
//    
//        if (self.m_isChatInterface) {
//        
//        if (self.m_ChatRoom2==EMConversationTypeChatRoom) {
//    
//    CGPoint contentOffsetPoint = self.tableView.contentOffset;
//    CGRect frame = self.tableView.frame;
//    
//    
//    
//    if (self.tableView.contentSize.height < self.tableView.frame.size.height || (contentOffsetPoint.y + 65)>= (self.tableView.contentSize.height - frame.size.height)) {
//        
//        if (self.m_ChatRoom2!=EMConversationTypeChat) {
//            [[NSNotificationCenter defaultCenter]postNotificationName:K_NONEWMessage object:nil];
//        }
//        //在低端
//        return YES;
//    }else if((self.tableView.contentSize.height - frame.size.height)-contentOffsetPoint.y > 80) {
//        //不在低端
//        return NO;
//    }else{
//        
//        return YES;
//    }
//        }else{
//            return YES;
//        }
//        }else{
//            
//            return YES;
//        }
//}
@end
