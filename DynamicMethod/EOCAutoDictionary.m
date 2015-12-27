//
//  EOCAutoDictionary.m
//  DynamicMethod
//
//  Created by 金融研發一部-蕭裕翰 on 12/27/15.
//  Copyright © 2015 金融研發一部-蕭裕翰. All rights reserved.
//

#import "EOCAutoDictionary.h"
#import <objc/runtime.h>

@interface EOCAutoDictionary()
@property (nonatomic, strong) NSMutableDictionary *backingStore;
@end

void autoDictionarySetter(id self, SEL _cmd, id value) {
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        ((EOCAutoDictionary *)self).backingStore[key] = value;
    }
    else {
        [((EOCAutoDictionary *)self).backingStore removeObjectForKey:key];
    }
}

id autoDictionaryGetter(id self, SEL _cmd) {
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    if ([key hasPrefix:@"get"]) {
        [key deleteCharactersInRange:NSMakeRange(0, 3)];
        NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
        [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    }
    NSMutableDictionary *backingStore = ((EOCAutoDictionary *)self).backingStore;
    return backingStore[key];
}

@implementation EOCAutoDictionary
@dynamic string, number;
- (id)init {
    if ((self = [super init])) {
        _backingStore = [@{} mutableCopy];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    }
    else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    return YES;
}
@end
