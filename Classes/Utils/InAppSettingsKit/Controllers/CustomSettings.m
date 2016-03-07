//
//  CustomSettingsr.m
//  Andvance2000
//
//  Created by CXRO on 07/10/15.
//
//

#import "CustomSettings.h"
static CustomSettings *sharedInstance = nil;

@implementation CustomSettings
#pragma mark Singleton Methods
{
    BOOL firstUse;
}
+ (id)sharedSettings
{
    @synchronized(self)
    {
        if(sharedInstance == nil)
        {
            sharedInstance = [[super allocWithZone:NULL] init];
           
        }
    }
    return sharedInstance;
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id) init
{
    self = [super init];
    firstUse=YES;
    if (self != nil)
    {
    }
    return self;
}
#pragma mark -
#pragma mark Private


#pragma mark -
#pragma mark Public

- (void)setVoiceMailDirectory:(NSString*)flag
{
    flag=[flag stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    flag=[flag stringByReplacingOccurrencesOfString:@":" withString:@"%3A"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:flag forKey:@"VoiceMailDirectory"];
    [defaults synchronize];
}
- (NSString*)getVoiceMailDirectory
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString *flag = [[NSUserDefaults standardUserDefaults] objectForKey:@"VoiceMailDirectory"];
    return flag;
    
}

- (BOOL)getSubstitutePlus
{
    if (firstUse)
    {
        firstUse=NO;
        return YES;
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    BOOL flag = [[NSUserDefaults standardUserDefaults] boolForKey:@"SubstitutePlus"];
    return flag;
}
- (void)setSubstitutePlus:(BOOL)flag
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:flag forKey:@"SubstitutePlus"];
    [defaults synchronize];
}

@end
