//
//  MessageTableViewCell.m
//  yanyan
//
//  Created by xiong on 2017/6/28.
//  Copyright © 2017年 XSD. All rights reserved.
//

#import "MessageTableViewCells.h"

@implementation MessageTableViewCells


-(UIImageView*)m_imgMessagePhoto
{
    if (!_m_imgMessagePhoto)
    {
        _m_imgMessagePhoto=[UIImageView new];
        _m_imgMessagePhoto.image=ImageNamed(@"avatar");
    }
    return _m_imgMessagePhoto;
}

-(UILabel*)m_labTime
{
    if (!_m_labTime)
    {
        _m_labTime=[[UILabel alloc]initWithFont:12 textColor:[UIColor blackColor]];
         _m_labTime.text=@"6-30";
        _m_labTime.textAlignment=NSTextAlignmentCenter;
       
    }
    return _m_labTime;
}
-(UILabel*)m_labLastMessage
{
    if (!_m_labLastMessage) {
        _m_labLastMessage=[[UILabel alloc]initWithFont:14 textColor:[UIColor grayColor]];
        _m_labLastMessage.text=@"私聊内容私聊内容私聊内容私聊内容私聊内容私聊内容私聊内容私聊内容私聊内容私聊内容私聊内容私聊内容";
      
    }
    return _m_labLastMessage;
}
-(UILabel*)m_labMessageName
{
    if (!_m_labMessageName) {
        _m_labMessageName=[[UILabel alloc]initWithFont:15 textColor:[UIColor blackColor]];
        _m_labMessageName.text=@"用户昵称";
    }
    return _m_labMessageName;
}
-(UILabel*)m_labNumberMessage
{
    if (!_m_labNumberMessage) {
        _m_labNumberMessage=[[UILabel alloc]initWithFont:14 textColor:[UIColor whiteColor]];
        _m_labNumberMessage.backgroundColor=[UIColor redColor];
        _m_labNumberMessage.text=@"99";
       
        _m_labNumberMessage.textAlignment=NSTextAlignmentCenter;
    }
    return _m_labNumberMessage;
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
     [self.contentView sd_addSubviews:@[self.m_imgMessagePhoto,self.m_labNumberMessage,self.m_labMessageName,self.m_labTime,self.m_labLastMessage]];

    //头像
    self.m_imgMessagePhoto.sd_layout
    .leftSpaceToView(self.contentView, RW(20))
    .centerYEqualToView(self.contentView)
    .widthIs(RW(100))
    .heightIs(RW(100));
   
    
    //时间
    self.m_labTime.sd_layout
    .widthIs(RW(100))
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView, RW(30));
   
    
    //名字
    self.m_labMessageName.sd_layout
    .topSpaceToView(self.contentView, RW(30))
    .leftSpaceToView(self.m_imgMessagePhoto, RW(30))
    .rightSpaceToView(self.m_labTime, RW(10))
    .autoHeightRatio(0);
    
    //消息数
    self.m_labNumberMessage.sd_layout
    .centerXEqualToView(self.m_labTime)
    .topSpaceToView(self.m_labTime, RW(5))
    .widthIs(RW(40))
    .heightEqualToWidth();
    
    //私聊内容
    self.m_labLastMessage.sd_layout
    .topSpaceToView(self.m_labMessageName, RW(15))
    .leftSpaceToView(self.m_imgMessagePhoto, RW(30))
    .rightSpaceToView(self.m_labNumberMessage, RW(10));
    
    [DTools getCorner:self.m_labNumberMessage radius:RW(20)];
     [DTools getCorner:self.m_imgMessagePhoto radius:RW(50)];
    [self.m_labLastMessage setMaxNumberOfLinesToShow:1];
}
@end
