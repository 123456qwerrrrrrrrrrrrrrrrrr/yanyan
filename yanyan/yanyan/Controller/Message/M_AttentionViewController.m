//
//  M_AttentionViewController.m
//  yanyan
//
//  Created by xiong on 2017/6/30.
//  Copyright © 2017年 XSD. All rights reserved.
//

#import "M_AttentionViewController.h"
#import "AttentionTableViewCell.h"
@interface M_AttentionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * m_tableView;
@end

@implementation M_AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"关注我的";
    // Do any additional setup after loading the view.
    [self initSD];
    // Do any additional setup after loading the view.
}
-(UITableView *)m_tableView
{
    if (!_m_tableView) {
        _m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,LCDW ,LCDH_H) style:UITableViewStylePlain];
        _m_tableView.delegate = self;
        _m_tableView.dataSource = self;
        [_m_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        _m_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine ;
        _m_tableView.separatorInset=UIEdgeInsetsMake(0, 0, 0,0);
        [self.view addSubview:_m_tableView];
    }
    
    return _m_tableView;
}
-(void)initSD
{
    
    
    self.m_tableView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;//默认是1
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //加载Xib
    static NSString * identifer = @"AttentionTableViewCell";
    AttentionTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出 //
    if (cell == nil) {
        
        // 是  TableViewCell 不是之前的系统的 UITableViewCell
        cell = [[AttentionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    //      MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    //    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RW(140);
    
}


//点击代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end