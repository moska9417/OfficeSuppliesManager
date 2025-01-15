//
//  MSKCacheManager.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/15.
//

#import "MSKCacheManager.h"
#import "YYCache.h"
#import "MSKDirectoryManager.h"

#define kCacheTemplateConfig                @"TemplateConfig"

#define kCacheTemplateConfigKey(cpId)       [NSString stringWithFormat:@"templateKey%llu", cpId]


@implementation MSKCacheManager

SYNTHESIZE_SINGLETON_FOR_CLASS(MSKCacheManager)

- (YYCache *)mainCache {
    if (!_mainCache) {
        _mainCache = [[YYCache alloc] initWithPath:[MSKDirectoryManager getFileCacheDirectory]];
    }
    return _mainCache;
}

@end
