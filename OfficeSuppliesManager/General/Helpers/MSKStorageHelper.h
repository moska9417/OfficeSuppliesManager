//
//  MSKStorageHelper.h
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSKStorageHelper : NSObject

+ (BOOL) createDirectoryIfNotExist:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
