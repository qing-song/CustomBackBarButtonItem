//
//  ThirdViewController.m
//  CustomBackBarButtonItem
//
//  Created by qingsong on 15/4/25.
//  Copyright (c) 2015年 qingsong. All rights reserved.
//

#import "ThirdViewController.h"
#import "YYNavigationControllerShouldPopProtocol.h"
@interface ThirdViewController ()
<YYNavigationControllerShouldPopProtocol>
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (BOOL)yy_navigaitonControllerShouldPopWhenSystemBackBtnSelect:(WFNavigationController *)navigationController
{
    
    UIAlertView * al = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你确认要放弃当前正在编辑的内容吗？" delegate:self cancelButtonTitle:@"留在此页" otherButtonTitles:@"放弃编辑", nil];
    al.tag = 10;
    [al show];
    
    return NO;
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 10) {
        if (!buttonIndex) {
            
            [self.navigationItem setHidesBackButton:YES];
            [self.navigationItem setHidesBackButton:NO];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 10) {
        if (buttonIndex) {
            
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
