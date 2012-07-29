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
	NSLog(@"INFO: Parsing took %llu ns using NSJSONSerialization", elapsedNano);
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
	NSLog(@"INFO: Parsing took %llu ns using JSONKit", elapsedNano);
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
	NSLog(@"INFO: Parsing took %llu ns using SBJSON", elapsedNano);
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
- (NSData *)PX_JSONDataError:(NSError **)error
{
	NSData *JSONData;
	
	PX_PROFILE_START
	
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
	JSONData = [NSJSONSerialization dataWithJSONObject:self
											   options:(PX_JSON_PRETTY_PRINT) ? NSJSONWritingPrettyPrinted : 0
												 error:error];
	
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
	JSONData = [self JSONDataWithOptions:(PX_JSON_PRETTY_PRINT) ? JKSerializeOptionPretty : JKSerializeOptionNone
								   error:error];
	
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
	SBJsonWriter *writer = [[SBJSONWritter alloc] init];
	writer.humanReadable = (PX_JSON_PRETTY_PRINT) ? YES : NO;
	JSONData = [writer dataWithObject:self];
	*error = writer.error;
	
#endif
	
	PX_PROFILE_END
	
	return JSONData;
}
@end

@implementation NSDictionary (Serialization)
- (NSData *)PX_JSONDataError:(NSError **)error
{
	NSData *JSONData;
	
	PX_PROFILE_START
	
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
	JSONData = [NSJSONSerialization dataWithJSONObject:self
											   options:(PX_JSON_PRETTY_PRINT) ? NSJSONWritingPrettyPrinted : 0
												 error:error];

#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
	JSONData = [self JSONDataWithOptions:(PX_JSON_PRETTY_PRINT) ? JKSerializeOptionPretty : JKSerializeOptionNone
								   error:error];
	
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
	SBJsonWriter *writer = [[SBJSONWritter alloc] init];
	writer.humanReadable = (PX_JSON_PRETTY_PRINT) ? YES : NO;
	JSONData = [writer dataWithObject:self];
	*error = writer.error;

#endif
	
	PX_PROFILE_END
	
	return JSONData;
}
@end


@implementation NSData (Deserialization)
- (id)PX_objectWithJSONDataError:(NSError **)error
{
	id object;
	
	PX_PROFILE_START
	
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	
	PX_PROFILE_END
	
	return object;
}

- (id)PX_mutablObjectWithJSONDataError:(NSError **)error
{
	id object;
	
	PX_PROFILE_START
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	PX_PROFILE_END
	
	return object;
}
@end

@implementation NSString (Deserialization)
- (id)PX_objectWithJSONStringError:(NSError **)error
{
	id object;
	
	PX_PROFILE_START
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	PX_PROFILE_END
	
	return object;
}

- (id)PX_mutablObjectWithJSONStringError:(NSError **)error
{
	id object;
	
	PX_PROFILE_START
#if PX_JSON_STRATEGY == PX_JSON_NATIVE
#elif PX_JSON_STRATEGY == PX_JSON_JSONKIT
#elif PX_JSON_STRATEGY == PX_JSON_SBJSON
#endif
	PX_PROFILE_END
	
	return object;
}
@end
