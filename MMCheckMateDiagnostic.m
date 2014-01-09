#import "main.h"


@implementation MMCheckMateDiagnostic

- (BOOL)execute:(NSError *__autoreleasing *)error {

    if (@"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk/System/Library/Frameworks/CheckMate.framework/CheckMate".isFile)
    {
        return YES;
    } else if (!error) {
        return NO;
    } else if ([@"~/Library/Frameworks/CheckMate.framework/Checkmate" stringByExpandingTildeInPath].isFile) {
        id info = @{
                    NSLocalizedDescriptionKey: @"In Terminal run:\n\n" "sudo ln -s /Users/mxcl/Library/Frameworks/CheckMate.framework /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk/System/Library/Frameworks"
                    };
        *error = [NSError errorWithDomain:MMErrorDomain code:MMDiagnosticFailedAmber userInfo:info];
        return NO;
    } else {
        id info = @{
            NSLocalizedDescriptionKey: @"You need to click: Install CheckMate"
        };
        *error = [NSError errorWithDomain:MMErrorDomain code:MMDiagnosticFailedRed userInfo:info];
        return NO;
    }
}

@end
