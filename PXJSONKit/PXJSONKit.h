//
//  PXJSONKit.h
//  PXJSONKit
//
//  Created by Paddy O'Brien on 12-07-28.
//  Copyright (c) 2012 500px. All rights reserved.
//
//  Used to evaluate various JSON Libraries. Th e need to define a common interface obviously leads to th loss of some features.

#define PX_PROFILING		0

#define PX_JSON_NATIVE		1	//Requires iOS5 or later
#define PX_JSON_JSONKIT		2
#define PX_JSON_SBJSON		3

#define PX_JSON_STRATEGY	PX_JSON_NATIVE


#import <Foundation/Foundation.h>

@interface NSArray (Serialization)
- (NSData *)PX_dataWithJSONObject:(id)obj error:(NSError **)error;
@end

@interface NSDictionary (Serialization)
- (NSData *)PX_dataWithJSONObject:(id)obj error:(NSError **)error;
@end


@interface NSData (Deserialization)
- (id)PX_objectWithJSONDataError:(NSError **)error;
- (id)PX_mutablObjectWithJSONDataError:(NSError **)error;
@end

@interface NSString (Deserialization)
- (id)PX_objectWithJSONStringError:(NSError **)error;
- (id)PX_mutablObjectWithJSONStringError:(NSError **)error;
@end