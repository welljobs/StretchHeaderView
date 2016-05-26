//
//  ViewController.m
//  StretchHeader
//
//  Created by biz on 16/5/25.
//  Copyright © 2016年 biz. All rights reserved.
//

#import "ViewController.h"
#import "SukeStretchHeaderView.h"
#import "CubeTableViewCell.h"
#import "UIImage+Addtion.h"

static NSString *kTableViewCell = @"UITableViewCell";
static NSString *kCubeTableViewCell = @"CubeTableViewCell";
static CGFloat kimageHeight = 200;

// 获取屏幕大小
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height
#define DURATION 1.0f


@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SukeStretchHeaderView *stretchHeaderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIImage *image1 = [UIImage imageWithColor:[UIColor clearColor]];
    
    
    [self.navigationController.navigationBar setBackgroundImage:image1
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:image1];
    
    [self initStretchHeader];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCell];
    UINib *cubeNib = [UINib nibWithNibName:kCubeTableViewCell bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:cubeNib forCellReuseIdentifier:kCubeTableViewCell];

}

- (void)initStretchHeader
{
    //背景
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kimageHeight)];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo" ofType:@"jpg"]];
    
    //背景之上的内容
    UIView *contentView = [[UIView alloc] initWithFrame:bgImageView.bounds];
    contentView.backgroundColor = [UIColor clearColor];
    
    /*
     UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
     avater.image = [UIImage imageNamed:@"avater"];
     avater.center = contentView.center;
     [contentView addSubview:avater];
     */
    
    self.stretchHeaderView = [SukeStretchHeaderView new];
    [self.stretchHeaderView stretchHeaderForTableView:self.tableView withView:bgImageView subViews:contentView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        CubeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCubeTableViewCell forIndexPath:indexPath];
        return cell;

    } else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCell forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"下拉头部视图放大%ld",indexPath.row];
        
        
        return cell;
    }
}
#pragma mark - stretchableTable delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.stretchHeaderView scrollViewDidScroll:scrollView];
}

- (void)viewDidLayoutSubviews
{
    [self.stretchHeaderView resizeView];
}
@end
