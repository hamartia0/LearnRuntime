//
//  ViewController.m
//  EncodeWithRuntime
//
//  Created by 赵白杨 on 2017/9/19.
//  Copyright © 2017年 赵白杨. All rights reserved.
//  利用Runtime机制，实现普遍使用的归档实现

#import "ViewController.h"
#import "MyTestObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 获取documents文件夹路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"heiyang.info"];
    NSLog(@"filePath = %@", filePath);
}

- (IBAction)encodeAction:(UIButton *)sender {
    
    // 初始化测试对象
    MyTestObject *testObject = [MyTestObject new];
    testObject.officalName = @"hei_heiyang";
    testObject.aliasArr = @[@"heiyang", @"baiyang", @"boer"];
    testObject.amountOfNames = 4;
    
    // 获取documents文件夹路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"heiyang.info"];
    NSLog(@"filePath = %@", filePath);
    
    // 归档
    BOOL res = [NSKeyedArchiver archiveRootObject:testObject toFile:filePath];
    
    if (res) {
        NSLog(@"成功");
    } else {
        NSLog(@"失败");
    }
}

- (IBAction)decodeAction:(UIButton *)sender {
    
    // 获取documents文件夹路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"heiyang.info"];
    NSLog(@"filePath = %@", filePath);
    
    MyTestObject *testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@ has %d names, like %@,%@,%@", testObject.officalName, testObject.amountOfNames, testObject.aliasArr[0], testObject.aliasArr[1], testObject.aliasArr[2]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
