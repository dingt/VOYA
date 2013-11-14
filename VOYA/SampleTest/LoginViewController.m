//
//  LoginViewController.m
//  SampleTest
//
//  Created by yangxia on 13-11-14.
//  Copyright (c) 2013年 yangxia. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize UserName,Password;
@synthesize LoginButton,CancleButton,RegisterButton;
 
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    //add gesture to hide keybroad when click the view
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];

}
-(void)viewTapped:(UITapGestureRecognizer*)tap{
    [self.UserName resignFirstResponder];
    [self.Password resignFirstResponder];
}
-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
-(void)dealloc{
    [super dealloc];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma MARK - IBOutlet method
-(IBAction)CancleButtonClick:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)LoginButtonClick:(id)sender{
    
}
#pragma mark- UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField == self.UserName) {
        [self.UserName resignFirstResponder];
        [self.Password becomeFirstResponder];
        return NO;
    }
    return YES;
}

int prewTag ;  //编辑上一个UITextField的TAG,需要在XIB文件中定义或者程序中添加，不能让两个控件的TAG相同
float prewMoveY; //编辑的时候移动的高度
-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFrame =  textField.frame;
    float textY = textFrame.origin.y+textFrame.size.height;
    float bottomY = self.view.frame.size.height-textY;
    if(bottomY>=216)  //判断当前的高度是否已经有216，如果超过了就不需要再移动主界面的View高度
    {
        prewTag = -1;
        return;
    }
    prewTag = textField.tag;
    float moveY = 216-bottomY;
    prewMoveY = moveY;
    
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y -=moveY;//view的Y轴上移
    frame.size.height +=moveY; //View的高度增加
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
    if(prewTag == -1) //当编辑的View不是需要移动的View
    {
        return;
    }
    float moveY ;
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    if(prewTag == textField.tag) //当结束编辑的View的TAG是上次的就移动
    {   //还原界面
        moveY =  prewMoveY;
        frame.origin.y +=moveY;
        frame.size. height -=moveY;
        self.view.frame = frame;
    }
    //self.view移回原位置
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    
    
}
@end
