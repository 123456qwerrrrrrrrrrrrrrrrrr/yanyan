//
//  M_ReceiveCommentTableViewCell.m
//  yanyan
//
//  Created by xiong on 2017/6/30.
//  Copyright © 2017年 XSD. All rights reserved.
//

#import "M_ReceiveCommentTableViewCell.h"

@implementation M_ReceiveCommentTableViewCell
-(UIImageView*)m_imgAvatar
{
    if (!_m_imgAvatar)
    {
        _m_imgAvatar=[UIImageView new];
        _m_imgAvatar.image=ImageNamed(@"avatar");
    }
    return _m_imgAvatar;
}

-(UILabel*)m_labTime
{
    if (!_m_labTime)
    {
        _m_labTime=[[UILabel alloc]initWithFont:12 textColor:[UIColor grayColor]];
        _m_labTime.text=@"6-30 22:00";
        
        
    }
    return _m_labTime;
}
-(UILabel*)m_labName
{
    if (!_m_labName) {
        _m_labName=[[UILabel alloc]initWithFont:14 textColor:[UIColor blackColor]];
        _m_labName.text=@"用户昵称";
        
    }
    return _m_labName;
}
-(UIButton *)m_btnReply
{
    if (!_m_btnReply) {
        _m_btnReply=[UIButton new];
        [_m_btnReply setNormalTitle:@"回复"];
        [_m_btnReply setBackgroundColor:[UIColor grayColor]];
    }
    return _m_btnReply;
}
// 重写构造方法 -- 只调用一次嘛 （套路来的！务必记住！）
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self initSD];
    }
    
    return self;
}

-(void)initSD
{
    UIView *bgTopView=[UIView new];
    [self.contentView addSubview:bgTopView];
    bgTopView.sd_layout
    .topSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView,0)
    .heightIs(RW(140));
    [bgTopView sd_addSubviews:@[self.m_imgAvatar,self.m_labName,self.m_labTime,self.m_btnReply]];
    
    
    //头像
    self.m_imgAvatar.sd_layout
    .leftSpaceToView(bgTopView, RW(20))
    .centerYEqualToView(bgTopView)
    .widthIs(RW(100))
    .heightIs(RW(100));
    [DTools getCorner:self.m_imgAvatar radius:RW(50)];
    
    //回复按钮
    self.m_btnReply.sd_layout
    .widthIs(RW(100))
    .heightIs(RW(50))
    .rightSpaceToView(bgTopView, RW(30))
    .centerYEqualToView(bgTopView);
    //昵称
    self.m_labName.sd_layout
    .leftSpaceToView(self.m_imgAvatar, RW(30))
    .topSpaceToView(bgTopView, RW(40))
    .rightSpaceToView(self.m_btnReply, RW(0))
    .autoHeightRatio(0);
    [self.m_labName setMaxNumberOfLinesToShow:1];
    
    //时间
    self.m_labTime.sd_layout
    .leftSpaceToView(self.m_imgAvatar, RW(30))
    .topSpaceToView(self.m_labName, RW(10))
    .rightSpaceToView(bgTopView, RW(0))
    .autoHeightRatio(0);

}

@end
