//
//  UniTestTests.m
//  UniTestTests
//
//  Created by Marshal on 2021/6/1.
//  单元测试,可以使用OCMock框架来实现单元测试

#import <XCTest/XCTest.h>
#import "Store.h"

@interface UniTestTests : XCTestCase

@end

@implementation UniTestTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//逻辑测试
- (void)test1 {
    NSInteger a = 10, b = 20;
    NSInteger r = [Store plus:a with:b];
    XCTAssertEqual(r, 30, @"逻辑有问题了");
}

//异步，执行时间测试
- (void)test2 {
    XCTestExpectation *ec = [self expectationWithDescription:@"不满足时间要求"];
    [Store loadData:^(id data){
        XCTAssertNotNil(data); //检查数据是否为空
        
        [ec fulfill];//时间填充
    }];
    //超时时间，超过这个时间就失败,系统会有一定的误差范围
    [self waitForExpectationsWithTimeout:2 handler:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
}

//销毁
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
        [self test1];
//        [self test2];
}

//性能测试，只有相对性，这里面开启异步多次测试取平均值
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    //可以点击下面一行左边的进行设置能接收的执行时间平均值
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        //测试性能代码可以放到这里面
        [Store loop];
    }];
}

@end
