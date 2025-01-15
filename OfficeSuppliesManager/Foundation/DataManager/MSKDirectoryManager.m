//
//  MSKDirectoryManager.m
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/15.
//

#import "MSKDirectoryManager.h"
#import "MSKStorageHelper.h"
@implementation MSKDirectoryManager

#pragma mark - Common

+(NSString *)getTempDirectory {
    return NSTemporaryDirectory();
}

+ (NSString *)getCacheDirectory {
    NSArray *lpPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *dir = nil;
    if ([lpPaths count] > 0) {
        dir = [NSString stringWithFormat:@"%@", [lpPaths objectAtIndex:0]];
        [MSKStorageHelper createDirectoryIfNotExist:dir];
    }
    return dir;
}

+ (NSString *)getCacheUserDirectory {
    NOT_IMPLEMENTED_FUNCTION
}

+ (NSString *)getCachePublicDirectory {
    NSString *dir = [NSString stringWithFormat:@"%@/Public", [self getCacheDirectory]];
    [MSKStorageHelper createDirectoryIfNotExist:dir];
    return dir;
}

#pragma mark - file cache

+ (NSString *)getFileCacheDirectory {
    NSString *dir = [NSString stringWithFormat:@"%@/filecache", [self getCachePublicDirectory]];

    [MSKStorageHelper createDirectoryIfNotExist:dir];
    return dir;
}
@end
