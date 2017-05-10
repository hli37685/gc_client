	#import "UUID.h"
#import "KeyChainStore.h"

@implementation iosUUID

+(NSString *)getIOSUUID:(NSString *)chainkey
{
    //获取项目的bundle ID
    NSString *bundleId = chainkey;
    //根据bundle ID拼接一个自定义的key用来作为keychain里面的唯一标示
    //NSString *keyUUid = [NSString stringWithFormat:@"%@.uuid",bundleId];
    //将bundle ID作为唯一key在keychain里面获取保存的uuid
    NSString * strUUID = (NSString *)[KeyChainStore load:bundleId];

    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        //将该uuid保存到keychain
        [KeyChainStore save:bundleId data:strUUID];
    }
    return strUUID;
}

@end
