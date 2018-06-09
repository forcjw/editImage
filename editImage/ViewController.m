//
//  ViewController.m
//  editImage
//
//  Created by cjw on 2018/6/9.
//  Copyright © 2018年 cjw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage* testImage1000x1000=[UIImage imageNamed:@"testImage1000x1000"];
    
    CGRect rect=CGRectMake(0, 100, testImage1000x1000.size.width/2,testImage1000x1000.size.height/2);
    
    UIImage* imageAfterCrop=[[UIImage alloc]init];
    imageAfterCrop=[self cropImage:testImage1000x1000 withRect:rect];
    
    //保存图片，要把路径转换成UIImage对象才能存
    UIImageWriteToSavedPhotosAlbum(imageAfterCrop,nil,nil,nil);
    
    NSLog(@"图片编辑完成:%@",imageAfterCrop);
    
}

//截图图片
- (UIImage *)cropImage:(UIImage *)image withRect:(CGRect )rect{
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    
    UIImage * img = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    
    return img;
    
}





@end
