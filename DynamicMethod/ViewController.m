//
//  ViewController.m
//  DynamicMethod
//
//  Created by 金融研發一部-蕭裕翰 on 12/27/15.
//  Copyright © 2015 金融研發一部-蕭裕翰. All rights reserved.
//

#import "ViewController.h"
#import "EOCAutoDictionary.h"
#import "EOCAutoDictionary+AddProperties.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EOCAutoDictionary *autoDic = [EOCAutoDictionary new];
    autoDic.string = @"123";
    NSLog(@"autoDic.string:%@", autoDic.string);
    
    [autoDic setValue:@"kk" forKey:@"kkk"];
    NSLog(@"autoDic.kkk:%@", [autoDic valueForKey:@"kkk"]);
    
    autoDic.jjj = @"JJJ";
    NSLog(@"autoDic.jjj:%@", autoDic.jjj);
    
    autoDic.qoo = @"QOO";
    NSLog(@"autoDic.qoo:%@", autoDic.qoo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
