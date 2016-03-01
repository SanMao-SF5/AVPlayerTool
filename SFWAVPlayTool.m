//
//  SFWAVPlayTool.m
//  音效的播放
//
//  Created by 沈方武 on 15/9/9.
//  Copyright © 2015年 沈方武. All rights reserved.
//

#import "SFWAVPlayTool.h"

@implementation SFWAVPlayTool
// 音效字典
static NSMutableDictionary *_soundsDict;
// 音乐播放器字典
static NSMutableDictionary *_musicsDict;

+ (void)initialize{

    _soundsDict = [NSMutableDictionary dictionary];
    _musicsDict = [NSMutableDictionary dictionary];
}

+ (void)playSoundWithName:(NSString *)soundName{
    
    // 从字典中取出对应音效的soundID
    SystemSoundID soundID = [_soundsDict[soundName] unsignedIntValue];
    
    // 判断取出的音效是否为空
    if (soundID == 0) {
        // 获取音效URL
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        // 创建对应音频文件
        AudioServicesCreateSystemSoundID(url, &soundID);
        // 将音效假如音效字典
        [_soundsDict setObject:@(soundID) forKey:soundName];
    }
    // 播放音效
    AudioServicesPlaySystemSound(soundID);
}

+ (void)playMusicWithName:(NSString *)musicName{

    // 从字典中取出播放器对象
    AVAudioPlayer *player = _musicsDict[musicName];
    
    // 判断播放器对象是否为空
    if (!player) {
        // 获取音乐URL
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        
        // 创建播放器对象
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        // 将播放器对象加入字典中（一个音乐文件对应一个播放器对象）
        [_musicsDict setObject:player forKey:musicName];
    }
    // 开始播放
    [player play];
}

+ (void)pauseMusicWithName:(NSString *)musicName{

    // 从字典中取出播放器对象
    AVAudioPlayer *player = _musicsDict[musicName];
    
    if (player) {
        
        // 暂停播放
        [player pause];
    }
}

+ (void)stopMusicWithName:(NSString *)musicName{

    // 从字典中取出播放器对象
    AVAudioPlayer *player = _musicsDict[musicName];
    
    if (player) {
        
        // 停止播放
        [player pause];
        [_musicsDict removeObjectForKey:musicName];
        player = nil;
    }
}

@end
