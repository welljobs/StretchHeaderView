//
//  CubeTableViewCell.m
//  StretchHeader
//
//  Created by biz on 16/5/25.
//  Copyright © 2016年 biz. All rights reserved.
//

#import "CubeTableViewCell.h"

@interface CubeTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *lbText;

@end
@implementation CubeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lbText.text = @"真的爱你";
    NSTimer *timer= [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(cellForCubeCATransition:) userInfo:nil repeats:YES];
    
    [timer fire];
}
- (void)cellForCubeCATransition:(NSTimer *)userinfo{
    [self transitionWithType:@"cube" WithSubtype:kCATransitionFromTop ForView:self.lbText];
    
    NSLog(@"userinfo == %@",[userinfo userInfo]);
    //    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = 0.7f;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
