//
//  EOCAutoDictionary+AddProperties.m
//  DynamicMethod
//
//  Created by 金融研發一部-蕭裕翰 on 12/27/15.
//  Copyright © 2015 金融研發一部-蕭裕翰. All rights reserved.
//

#import "EOCAutoDictionary+AddProperties.h"
#import <objc/runtime.h>

@implementation EOCAutoDictionary (AddProperties)
@dynamic  jjj, qoo;

- (void)setQoo:(NSString *)qoo {
    objc_setAssociatedObject(self, @selector(qoo), qoo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)qoo {
    return objc_getAssociatedObject(self, @selector(qoo));
}
@end
