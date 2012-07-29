//
//  PXJSONKit.m
//  PXJSONKit
//
//  Created by Paddy O'Brien on 12-07-28.
//  Copyright (c) 2012 500px. All rights reserved.
//

#import "PXJSONKit.h"
#import <mach/mach.h>
#import <mach/mach_time.h>

#if PX_JSON_STRATEGY == PX_JSON_JSONKIT
#import "JSONKit.h"
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#import "SBJson.h"
#endif

// Profiling
void PXComputeDelta(uint64_t start, uint64_t end, const char *methodName)
{
	uint64_t elapsed = end - start;
	uint64_t elapsedNano;
	static mach_timebase_info_data_t    sTimebaseInfo;
	
    if ( sTimebaseInfo.denom == 0 ) {
        (void) mach_timebase_info(&sTimebaseInfo);
    }
	
    elapsedNano = elapsed * sTimebaseInfo.numer / sTimebaseInfo.denom;
	
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
}

#if PX_PROFILING
#define PX_PROFILE_START uint64_t start = mach_absolute_time();
#else
#define PX_PROFILE_START
#endif

#if PX_PROFILING
#define PX_PROFILE_END uint64_t end = mach_absolute_time(); PXComputeDelta(start, end, __PRETTY_FUNCTION__);
#else
#define PX_PROFILE_END
#endif


@implementation NSArray (Serialization)
- (NSData *)PX_dataWithJSONObject:(id)obj error:(NSError **)error
{
	NSData *JSONData;
	
	PX_PROFILE_START
	
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	
	PX_PROFILE_END
	
	return JSONData;
}
@end

@implementation NSDictionary (Serialization)
- (NSData *)PX_dataWithJSONObject:(id)obj error:(NSError **)error
{
	NSData *JSONData;
	
	PX_PROFILE_START
	
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	
	PX_PROFILE_END
	
	return JSONData;
}
@end


@implementation NSData (Deserialization)
- (id)PX_objectWithJSONDataError:(NSError **)error
{
	PX_PROFILE_START
	
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	
	PX_PROFILE_END
}

- (id)PX_mutablObjectWithJSONDataError:(NSError **)error
{
	PX_PROFILE_START
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	PX_PROFILE_END
}
@end

@implementation NSString (Deserialization)
- (id)PX_objectWithJSONStringError:(NSError **)error
{
	PX_PROFILE_START
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	PX_PROFILE_END
}

- (id)PX_mutablObjectWithJSONStringError:(NSError **)error
{
	PX_PROFILE_START
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	PX_PROFILE_END
}
@end
