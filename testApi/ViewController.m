//
//  ViewController.m
//  testApi
//
//  Created by Shibo Sun on 2018/6/29.
//  Copyright © 2018 Shibo Sun. All rights reserved.
//

#import "ViewController.h"
#import "NSData+KKAES.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 30)];
    [btn setTitle:@"decrypt" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(decryptData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)decryptData{
    NSString *base64Encoded = @"mDLGcZfkM5Mbt9b4bPEXnxzmjiNBGwgqyhtnF1sFwV5cvz4WV2RKGofTV/0U1BCzghw3wpiYGmq8jVN4xCohSFRH3zzRNIzhQOmFC9lyNTP9/e2SrlmYV3kBqAblsURrHJONB7btrqC1YjBihKYZ/VB5EJe0f+StO5jU1xehS6GyhcQA3nZp7z2kVdzfQ7Cb3sPke5Icj8yHLhZbcoP/cBqXiNyko5cDfyUUEqlUjTZG8R1jIL0knZtX91SA+JytfI34UAJWNlm2PRbPtSvug8z/R14eAj2PONuuuKdQpfm4zdd8+sjRuiVTqOHdnwhB0ScmfhsXJ2oP2i347ITogCicz8INeTGOANy5V+OsmT6KmNy43D8MP+fV9LIJUbeAztbcX7ATfXm5prE0iHJ3xKnErGAx4RnOnCgA1ACNL3wVGJ28eG7AiKaSCjQLOE+FTMr3Oj8lrcmRMmoo46nVdUSLCe2QV1YEx1nBGzJ2LdaoOyiXDOiyPM5dVs2AJUiJ";
    
//    NSString *base64Encoded = @"kPUnfXh3MlXfJqQiUuwT6A==";
    NSData *base64EncodedData = [[NSData alloc] initWithBase64EncodedString:base64Encoded options:0];
    NSData *key32 = [@"e2a93cf0acdf470d617c088cbd11586b" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *edec32 = [base64EncodedData  AES_ECB_DecryptWith:key32];
    NSString *string = [[NSString alloc] initWithData:edec32 encoding:NSUTF8StringEncoding];
    
    NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *configs = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    NSLog(@"configs = %@",configs);
    
}

@end
