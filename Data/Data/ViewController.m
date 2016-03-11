//
//  ViewController.m
//  Data
//
//  Created by mac  on 13-3-4.
//  Copyright (c) 2013年 Sky. All rights reserved.
//

#import "ViewController.h"
#import "DataFactory.h"
#import "TestModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Btn_NewTable:(id)sender
{
    //判断是否创建数据库
    if ([[DataFactory shardDataFactory] IsDataBase])
    {
        [[DataFactory shardDataFactory] CreateDataBase];
        [[DataFactory shardDataFactory] CreateTable];
    }
}

- (IBAction)Btn_AddData:(id)sender
{
    TestModel *model=[[[TestModel alloc]init]autorelease];
    model.Bid=@"1";
    model.StoreName=@"测试";
    model.Latitude=@"11";
    model.Longitude=@"22";
    [[DataFactory shardDataFactory]insertToDB:model Classtype:test];
}
//也可以删除全部数据,也可以根据条件删除，自己看工厂的里面的方法
- (IBAction)Btn_DeleteData:(id)sender
{
    TestModel *model=[[[TestModel alloc]init]autorelease];
    model.Bid=@"1";
    model.StoreName=@"测试";
    model.Latitude=@"11";
    model.Longitude=@"22";
    [[DataFactory shardDataFactory]deleteToDB:model Classtype:test];
}

- (IBAction)Btn_Update:(id)sender
{
    TestModel *model=[[[TestModel alloc]init]autorelease];
    model.Bid=@"1";
    model.StoreName=@"测试22";
    model.Latitude=@"22222";
    model.Longitude=@"22222";
    [[DataFactory shardDataFactory]updateToDB:model Classtype:test];
}

- (IBAction)Btn_Select:(id)sender
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [dic setObject:@"1" forKey:@"Bid"];
    [[DataFactory shardDataFactory]searchWhere:dic orderBy:nil offset:0 count:100 Classtype:test callback:^(NSArray *result)
    {
        NSLog(@"%@",result);
    }];
}
@end
