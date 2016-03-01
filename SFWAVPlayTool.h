//
//  SFWAVPlayTool.h
//  音效的播放
//
//  Created by 沈方武 on 15/9/9.
//  Copyright © 2015年 沈方武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SFWAVPlayTool : NSObject

/** 根据传递的音效名称播放音效 */
+ (void)playSoundWithName:(NSString *)soundName;

/** 根据传递的音乐名播放音乐 */
+ (void)playMusicWithName:(NSString *)musicName;
/** 根据传递的音乐名暂停音乐 */
+ (void)pauseMusicWithName:(NSString *)musicName;
/** 根据传递的音乐名停止音乐 */
+ (void)stopMusicWithName:(NSString *)musicName;

@end
