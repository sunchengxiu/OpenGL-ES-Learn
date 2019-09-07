//
//  scene.m
//  OpenGL ES Test
//
//  Created by 孙承秀 on 2019/8/29.
//  Copyright © 2019 孙承秀. All rights reserved.
//


#import "scene.h"
// 将 CPU 数据放到 GPU
GLuint vbo;
void Init(){
    // 数据从 cpu 发送到 GPU 显卡
    float data[] = {
        -0.2f,-0.2f,-0.6f,1.0f,
        0.2f,-0.2f,-0.6f,1.0f,
        0.0f,0.2f,-0.6f,1.0f
    };
    // 一个 vbo,vbo 地址，修改地址里面的值，变成 OpenGL 可以识别的，指向显存。
    glGenBuffers(1, &vbo);
    // 把 vbo 设置为当前 buffer
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    // 将 CPU 数据发送到 GPU,在 GPU开辟内存空间
    glBufferData(GL_ARRAY_BUFFER, 12 * sizeof(float), data, GL_STATIC_DRAW);
    // 0 代表设置当前buffer为0，CPU上面的可以不用了
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    
}
void SetViewSize(int width , int height){
    
}
void Draw(){
    glClearColor(0.1f,0.4f,0.7f,1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

