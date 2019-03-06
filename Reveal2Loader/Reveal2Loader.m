//
//  Reveal2Loader.m
//  Reveal2Loader
//
//  Created by h4ck on 2019/2/19.
//  Copyright (c) 2019年 __MyCompanyName__. All rights reserved.
//

#import "Reveal2Loader.h"
#import "CaptainHook.h"
#include <dlfcn.h>

CHConstructor // code block that runs immediately upon load
{
  
  NSLog(@"Hello I'm Muukii");
  @autoreleasepool
  {
    NSString *libraryPath = @"/Library/Frameworks/RevealServer.framework/RevealServer";
    if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
      
      char *errstr;
      void *addr = dlopen([libraryPath UTF8String], RTLD_NOW);
      errstr = dlerror();
      if(addr){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
        NSLog(@"Reveal2Loader loaded %@ successed, address %p", libraryPath,addr);
      }
      else {
        NSLog(@"Reveal2Loader loaded %@ failed, address %p", libraryPath,addr);
        if (errstr) {
          NSLog(@"Reveal2Loader A dynamic linking error occurred: (%s)", errstr);
        }
      }
    }
  }
}

