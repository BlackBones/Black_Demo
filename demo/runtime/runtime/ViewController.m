//
//  ViewController.m
//  runtime
//
//  Created by 刘波 on 16/4/29.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Dog.h"


@interface NSMutableArray (LoggingAddObject)

@property (nonatomic,copy) NSString *testString;


- (void)logAddObject:(id)aObject;

@end

@implementation NSMutableArray (LoggingAddObject)

static const void *objectkey = "testStringKey";

- (void)setTestString:(NSString *)testString{
    
    //关联属性
    NSLog(@"objectkey = %p",objectkey);
    objc_setAssociatedObject(self, objectkey, testString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)testString{
    
    return  objc_getAssociatedObject(self, objectkey);
}


/**
 *  动态交换两个方法的实现
 */
+ (void)load {
    /**
     *  特别注意 NSMutableArray的本类是 __NSArrayM
     *  相应的NSMutableDictionary的本类实质是 __NSDictionaryM
     */
    Method addobject = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(addObject:));
    Method logAddObject = class_getInstanceMethod(self, @selector(logAddObject:));
    method_exchangeImplementations(addobject, logAddObject);
}

- (void)logAddObject:(id)aObject {
    
    //处理添加对象为空的情况
    if (aObject == nil) {
        NSLog(@"添加对象为nil");
        return;
    }
    //递归调用，因为交换过后，实质是调用addObject
    [self logAddObject:aObject];
    
}


@end


@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /************ runtime很强大，知道到这点就够了！！！*************/
    /************** 知道得太多对你没什么好处！！！！*************/
    
    //头文件 #import <objc/runtime.h>
    
    /**
     1.能动态产生一个类，一个成员变量，一个方法
     2.能动态修改一个类，一个成员变量，一个方法
     3.能动态删除一个类，一个成员变量，一个方法
     */
    
    //常见应用
    /**
     *  1.获取属性\成员变量列表，方法列表（快速归解档，字典转模型）
     *  2.动态交换方法的实现
     *  3.类\对象的关联对象（在类别中为类添加属性）
     *  4.动态添加方法，拦截未实现的方法
     *  5.动态创建一个类
     */
    
    
    
    /**
     *  获取属性\成员变量列表，方法列表
     */
    
    [self test1];
    
    
    /**
     *  为NSMutableArray加类别，添加方法logAddObject，然后与系统的addObject 交换实现，在保证系统方法依然可以调用的前提下，又防止了添加对象为nil时，程序会crash
     */
    [self test2];
    
    
    /**
     *  类别中，为NSMutableArray添加一个属性
     */
    [self test3];
    
    
    /**
     *  为Dog类添加方法sayHi
     */
    [self test4];
    
}

- (void)test1{
    
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([Dog class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    
    Ivar *ivarList = class_copyIvarList([Dog class], &count);
    for (unsigned int i=0 ; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    free(ivarList);//手动释放
    
    //获取方法列表
    Method *methodList = class_copyMethodList([Dog class], &count);
     
    
    
}

- (void)test2{
    
    NSMutableArray *testArr = [NSMutableArray array];
    
    [testArr addObject:nil];//警告而已，我们已经换了方法的实现，不用在意
    
    [testArr logAddObject:@"123"];
    
    NSLog(@"testArr = %@",testArr);
    
}

- (void)test3{
    
    NSMutableArray *testArr = [NSMutableArray array];
    
    testArr.testString = @"TEST";
    
    NSLog(@"testArr.testString = %@",testArr.testString);
    
}

void abc(id self, SEL _cmd, NSString *content){ // 增加了一个参数content
    NSLog(@"Hello %@",  content);
}

- (void)test4{
    //添加方法
    if (class_addMethod([Dog class], @selector(sayHi:), abc, "v@:@")) {
        NSLog(@"添加成功");
    }
    
    Dog *dog = [[Dog alloc] init];
    
//    dog.name = @"Lemon";
    
    //不要在意警告
    [dog performSelector:@selector(sayHi:) withObject:@"lemon"];
    
    
}

- (void)test5{
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
