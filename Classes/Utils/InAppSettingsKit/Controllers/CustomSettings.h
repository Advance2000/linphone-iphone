//
//  CustomSettingsr.h
//  Andvance2000
//
//  Created by CXRO on 07/10/15.
//
//

#import <Foundation/Foundation.h>

@interface CustomSettings : NSObject
+ (id)sharedSettings;

- (NSString*)getVoiceMailDirectory;
- (void)setVoiceMailDirectory:(NSString*)flag;

- (BOOL)getSubstitutePlus;
- (void)setSubstitutePlus:(BOOL)flag;

@end
