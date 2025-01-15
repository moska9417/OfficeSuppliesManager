//
//  MSKCacheManager.h
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/15.
//

#import <Foundation/Foundation.h>
#import "YYCache.h"
NS_ASSUME_NONNULL_BEGIN

#define kCacheKeyTestkey @"testKey"

@interface MSKCacheManager : NSObject

DECLARE_SINGLETON_FOR_CLASS(MSKCacheManager)

@property (nonatomic, strong) YYCache *mainCache;

@end

NS_ASSUME_NONNULL_END
