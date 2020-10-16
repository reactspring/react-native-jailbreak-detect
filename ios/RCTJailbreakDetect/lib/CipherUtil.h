//
//  CipherUtil.h
//
//
//  ReactSpring.io

#import <Foundation/Foundation.h>

@interface CipherUtil : NSObject
+ (NSString *) toHex: (NSData *)nsdata;
+ (NSData *) fromHex: (NSString *)string;
@end
