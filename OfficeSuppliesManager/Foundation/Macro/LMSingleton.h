//
//  LMSingleton.h
//  OfficeSuppliesManager
//
//  Created by 赵兰清 on 2025/1/15.
//

#ifndef LMSingleton_h
#define LMSingleton_h
#define DECLARE_SINGLETON_FOR_CLASS(classname) \
+ (classname*)shared##classname;

#define GET_SINGLETON_FOR_CLASS(classname) \
[classname shared##classname]

// with ARC
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
+ (classname *)shared##classname\
{\
static classname *shared##classname = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##classname = [[classname alloc] init];\
});\
return shared##classname;\
}

// not incomplete
#define NOT_IMPLEMENTED_FUNCTION \
@throw [NSException exceptionWithName:NSInternalInconsistencyException \
                               reason:@"This Method is not yet implemented." \
                             userInfo:nil];
#endif /* LMSingleton_h */
