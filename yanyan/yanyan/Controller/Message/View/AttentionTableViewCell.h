//
//  AttentionTableViewCell.h
//  yanyan
//
//  Created by xiong on 2017/6/30.
//  Copyright © 2017年 XSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttentionTableViewCell : UITableViewCell
/**
 *  用户昵称
 */
@property (strong, nonatomic)  UILabel *m_labName;
/**
 *  时间
 */
@property (strong, nonatomic)  UILabel *m_labTime;
/**
 *  人头像
 */
@property (strong, nonatomic)  UIImageView *m_imgAvatar;
@end
