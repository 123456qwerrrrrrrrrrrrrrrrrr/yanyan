//
//  AttentionTableViewCell.m
//  yanyan
//
//  Created by xiong on 2017/6/30.
//  Copyright © 2017年 XSD. All rights reserved.
//

#import "AttentionTableViewCell.h"

@implementation AttentionTableViewCell

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
        _m_labTime.text=@"2017-6-30";
       
        
    }
    return _m_labTime;
}
-(UILabel*)m_labName
{
    if (!_m_labName) {
        _m_labName=[[UILabel alloc]initWithFont:14 textColor:[UIColor blackColor]];
        _m_labName.text=@"用户昵称关注了你";
        
    }
    return _m_labName;
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
    [self.contentView sd_addSubviews:@[self.m_imgAvatar,self.m_labName,self.m_labTime]];
    
    //头像
    self.m_imgAvatar.sd_layout
    .leftSpaceToView(self.contentView, RW(20))
    .centerYEqualToView(self.contentView)
    .widthIs(RW(100))
    .heightIs(RW(100));
    
    //昵称
    self.m_labName.sd_layout
    .leftSpaceToView(self.m_imgAvatar, RW(30))
    .topSpaceToView(self.contentView, RW(40))
    .rightSpaceToView(self.contentView, RW(0));
    
    //时间
    self.m_labTime.sd_layout
    .leftSpaceToView(self.m_imgAvatar, RW(30))
    .topSpaceToView(self.m_labName, RW(10))
    .rightSpaceToView(self.contentView, RW(0))
    .autoHeightRatio(0);
}
@end
