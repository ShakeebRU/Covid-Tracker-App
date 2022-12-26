//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<objectbox_flutter_libs/ObjectboxFlutterLibsPlugin.h>)
#import <objectbox_flutter_libs/ObjectboxFlutterLibsPlugin.h>
#else
@import objectbox_flutter_libs;
#endif

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [ObjectboxFlutterLibsPlugin registerWithRegistrar:[registry registrarForPlugin:@"ObjectboxFlutterLibsPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
