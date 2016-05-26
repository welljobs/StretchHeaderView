//
//  SukeStretchHeaderView.h
//  StretchHeader
//
//  Created by biz on 16/5/25.
//  Copyright © 2016年 biz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SukeStretchHeaderView : NSObject
@property (nonatomic,retain) UITableView* tableView;
@property (nonatomic,retain) UIView* view;


/**
 * subview:内容部分
 * view   :拉伸的背景图片
 */
- (void)stretchHeaderForTableView:(UITableView*)tableView
                         withView:(UIView*)view
                         subViews:(UIView*)subview;

- (void)scrollViewDidScroll:(UIScrollView*)scrollView;

- (void)resizeView;
@end
