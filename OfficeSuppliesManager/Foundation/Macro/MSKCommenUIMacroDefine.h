//
//  MSKCommenUIMacroDefine.h
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/6.
//

#ifndef MSKCommenUIMacroDefine_h
#define MSKCommenUIMacroDefine_h


#pragma mark - 颜色转换方法 UIRGBColor(25, 25, 25) UIColorFromRGB(0xf23a4b)
/////////////////////////////////////////////////////////////////////
#define UIRGBColor(r,g,b)       UIRGBAColor(r,g,b,1.0)
#define UIRGBAColor(r,g,b,a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define UIColorFromRGB(rgbValue)        UIColorFromRGBA(rgbValue,1.0)
#define UIColorFromRGBA(rgbValue,a)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                                        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                                        blue:((float)(rgbValue & 0xFF))/255.0 \
                                                        alpha:a]
/////////////////////////////////////////////////////////////////////

#pragma mark - 常用颜色定义
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define kBackgroudColorForBottomSpace   [UIColor colorWithRed:0xD3/255.0 green:0xD3/255.0 blue:0xD3/255.0 alpha:1]
#define kBackgroudColorForTopSpace      [UIColor colorWithRed:0xFF/255.0 green:0xFF/255.0 blue:0xFF/255.0 alpha:1]
#define kBackgroudColorForTopSpaceEx    [UIColor colorWithRed:0xC8/255.0 green:0xC8/255.0 blue:0xC8/255.0 alpha:1]

#define kThemeTextColor                 [UIColor colorWithRed:0xff/255.0 green:0xc2/255.0 blue:0x1c/255.0 alpha:1]

#define kTextViewTextColor              [UIColor colorWithRed:0xde/255.0 green:0xde/255.0 blue:0xde/255.0 alpha:1]
#define kTextViewTextRedColor           [UIColor colorWithRed:0xf2/255.0 green:0x3a/255.0 blue:0x4b/255.0 alpha:1] //主色红色
#define kTextNameTextColor              [UIColor colorWithRed:0x83/255.0 green:0xa8/255.0 blue:0xc3/255.0 alpha:1] //动态名字颜色

#define kCommViewBackgroundColor        [UIColor colorWithRed:0xf7/255.0 green:0xf9/255.0 blue:0xfa/255.0 alpha:1] //UI底色
#define kCommLabelColorTitleText        [UIColor colorWithRed:0x33/255.0 green:0x33/255.0 blue:0x33/255.0 alpha:1] //主要文字、标题
#define kCommLabelColorAssistText       [UIColor colorWithRed:0xaa/255.0 green:0xaa/255.0 blue:0xaa/255.0 alpha:1] //辅助文字
#define kCommLabelColorDescribeText     [UIColor colorWithRed:0xe1/255.0 green:0xe1/255.0 blue:0xe1/255.0 alpha:1] //描边颜色
#define kCommWhiteBackground            [UIColor colorWithRed:0xff/255.0 green:0xff/255.0 blue:0xff/255.0 alpha:1] //白色背景
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 常用字体定义
//////////////////////////////////////////////////////////////////
#define kCommLableFontTitleText     [UIFont systemFontOfSize:17.0]  //标题栏主标题
#define kCommLabelFontSubTitleText  [UIFont systemFontOfSize:16.0]  //标题栏副标题
#define kCommLableFontMainText      [UIFont systemFontOfSize:14.0]  //主要内容
#define kCommLabelFontMinorText     [UIFont systemFontOfSize:12.0]  //次要内容
#define kCommLabelFontAssistText    [UIFont systemFontOfSize:10.0]  //辅助内容
//////////////////////////////////////////////////////////////////

#pragma mark - 图片参数定义
//////////////////////////////////////////////////////////////////
// 头像图片最大容量(byte)
#define HEAD_IMAGE_MAX_SIZE (0.5 * 1000 * 1000)
//////////////////////////////////////////////////////////////////

#pragma mark - 视图高度系数
////////////////////////////////////////////
CGFloat getViewScale(void);

#define kViewHeightScale    (getViewScale())
////////////////////////////////////////////

#pragma mark - 常量数据定义

#define SCREEN_BOUNDS   [[UIScreen mainScreen] bounds]
#define SCREEN_SIZE     [[UIScreen mainScreen] bounds].size

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#define YWKeyWindow  AppDelegate.defaultDelegate.window


#pragma mark - 其他常量定义

#define HOME_MAIN_TABBAR_HEIGHT     49
#define SYSTEM_STATUES_BAR_HEIGHT   20 //天线栏高度
#define SYSTEM_NAVBAR_HEIGHT        44

#define kTopChartsListNum (3)  //123名需要单独处理


#endif /* MSKCommenUIMacroDefine_h */
