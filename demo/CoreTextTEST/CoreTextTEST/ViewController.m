//
//  ViewController.m
//  CoreTextTEST
//
//  Created by 刘波 on 16/5/9.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "ViewController.h"
#import "NSString+WPAttributedMarkup.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *testStr = @"Attributed <bold>Bold</bold> <red>Red</red> text ";
    
    NSDictionary* style1 = @{@"body":[UIFont fontWithName:@"HelveticaNeue" size:18.0f],@"bold":[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],@"red": [UIColor redColor], @"blue":[UIColor blueColor]};
    NSDictionary *style2 = @{@"body":[UIFont systemFontOfSize:20.0f],@"bold":[UIFont systemFontOfSize:15.0f],@"red": [UIColor redColor]};
    
    _testLabel.attributedText = [testStr attributedStringWithStyleBook:style2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
