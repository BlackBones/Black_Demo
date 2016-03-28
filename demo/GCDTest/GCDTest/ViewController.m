//
//  ViewController.m
//  GCDTest
//
//  Created by 刘波 on 16/3/23.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /**
     *  死锁
     */
    //    NSLog(@"=================1");
    //
    //    dispatch_sync(dispatch_get_main_queue(), ^{
    //        NSLog(@"=================2");
    //
    //    });
    //
    //    NSLog(@"=================3");
    //
    
    
    /**
     *  不会死锁
     */
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        NSLog(@"=================1");
        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"=================2");
//            
//        });
        
    });
    [NSThread sleepForTimeInterval:1];
    NSLog(@"=================3");

    
    NSLog(@"TEST 1");
    
    dispatch_queue_t globalQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    dispatch_async(globalQueue, ^{
        
        NSLog(@"TEST 2");
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"TEST 3");
    });
    
    NSLog(@"TEST 4");
    
    
    dispatch_queue_t queue = dispatch_queue_create("test123", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 5; i ++) {
        dispatch_async(queue, ^{
            NSLog(@"串行异步：%@ %d",[NSThread currentThread],i);
        });
    }
    
    for (int i = 0; i < 5; i++) {
        
        dispatch_sync(queue, ^{
            NSLog(@"串行同步：%@ %d",[NSThread currentThread],i);
        });
    }
    
    
    dispatch_queue_t queue_barrier = dispatch_queue_create("gcdtest.rongfzh.yc", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue_barrier, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"dispatch_async1");
    });
    dispatch_async(queue_barrier, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"dispatch_async2");
    });
    
    /**
     * 前面的任务执行结束后它才执行，而且它后面的任务等它执行完成之后才会执行
     */
//    dispatch_barrier_async(queue_barrier, ^{
//        NSLog(@"dispatch_barrier_async");
//        [NSThread sleepForTimeInterval:0.5];
//        
//    });
//    dispatch_async(queue_barrier, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"dispatch_async3");
//    });
   
    /**
     *  可以实现监听一组任务是否完成，完成后得到通知执行其他的操作
     */
//    dispatch_queue_t queue_group = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, queue_group, ^{
//        [NSThread sleepForTimeInterval:6];
//        NSLog(@"group1 [NSThread sleepForTimeInterval:6];");
//    });
//    dispatch_group_async(group, queue_group, ^{
//        [NSThread sleepForTimeInterval:3];
//        NSLog(@"group2 [NSThread sleepForTimeInterval:3];");
//    });
//    dispatch_group_async(group, queue_group, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"group3 [NSThread sleepForTimeInterval:1];");
//    });
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"main thread.");
//    });
    
    /**
     *  延迟执行
     */
    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        NSLog(@"dispatch_after");
    });
    
    /**
     *  设置queue的优先级
     */
//    dispatch_set_target_queue 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
