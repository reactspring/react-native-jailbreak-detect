//
//  RCTJailbreakDetect.h
//
//  ReactSpring.io

#import "RCTJailbreakDetect.h"
#import "CipherUtil.h"

@implementation RCTJailbreakDetect

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(jailBrokenCheck:(NSString *)parametes
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = isJailbroken ();
    if (data == nil) {
        reject(@"detect_fail", @"Hash error", error);
    } else {
        resolve(data);
    }
}
 
NSString *isJailbroken () {
#if !(TARGET_IPHONE_SIMULATOR)
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] ||
        [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]) {
        return @"RC-0002";
    }
 
    FILE *f = NULL;
    if ((f = fopen("/bin/bash", "r")) ||
        (f = fopen("/Applications/Cydia.app", "r")) ||
        (f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r")) ||
        (f = fopen("/usr/sbin/sshd", "r")) ||
        (f = fopen("/etc/apt", "r"))) {
        fclose(f);
        return @"RC-0002";
    }
    fclose(f);
 
    NSError *error;
    [@"Jailbreak Test" writeToFile:@"/private/jailbreak.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
 
    if(error == nil) {
        return @"RC-0002";
    }
    else {
        [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];
    }
#endif
 
    return @"RC-1002";
}

@end
