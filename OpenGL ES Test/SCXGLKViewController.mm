//
//  SCXGLKViewController.m
//  OpenGL ES Test
//
//  Created by 孙承秀 on 2019/8/29.
//  Copyright © 2019 孙承秀. All rights reserved.
//

#import "SCXGLKViewController.h"
#import <GLKit/GLKit.h>
#import "scene.h"
#import "Utils.h"
unsigned char * LoadFileContent(const char * fileName , int &fileSize){
    NSString *nsFileName = [NSString stringWithUTF8String:fileName];
    unsigned char *fileContent = nil;
    fileSize = 0;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:nsFileName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    fileSize = (unsigned)[data length];
    if ([data length]) {
        fileContent = new unsigned char[fileSize + 1];
        memcpy(fileContent, [data bytes], fileSize);
        fileContent[fileSize + 1] = '\0';
    }
    return fileContent;
}


@interface SCXGLKViewController ()
/**
 context
 */
@property(nonatomic , strong)EAGLContext *context;
@end

@implementation SCXGLKViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (!self.context) {
        self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    }
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    [EAGLContext setCurrentContext:self.context];
    Init();
    SetViewSize([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    Draw();
}

@end
