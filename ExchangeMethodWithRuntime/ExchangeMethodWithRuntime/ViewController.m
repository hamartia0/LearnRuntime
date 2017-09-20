//
//  ViewController.m
//  ExchangeMethodWithRuntime
//
//  Created by 赵白杨 on 2017/9/20.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "ViewController.h"
#import "NSURL+Security.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[self generateReqWithStr:@"https://www.bing.com"]];
}

- (NSURLRequest *)generateReqWithStr:(NSString *)str {
    NSURL *url = [NSURL URLWithString:str];
//    NSURL *url = [NSURL HHY_URLWithString:str];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    return req;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
