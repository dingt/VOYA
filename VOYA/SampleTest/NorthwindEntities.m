/**
*
*Copyright 2010 OuterCurve Foundation
*
*Licensed under the Apache License, Version 2.0 (the "License");
*you may not use this file except in compliance with the License.
*You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
*Unless required by applicable law or agreed to in writing, software
*distributed under the License is distributed on an "AS IS" BASIS,
*WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*See the License for the specific language governing permissions and
*limitations under the License.
*/
/**
* This code was generated by the tool 'odatagen'.
* Runtime Version:1.0
*
* Changes to this file may cause incorrect behavior and will be lost if
* the code is regenerated.
*/
#import "NorthwindEntities.h"

 
/**
 * Container interface NorthwindEntities, Namespace: NorthwindModel
 */
@implementation NorthwindEntities 

	@synthesize m_OData_etag;

	@synthesize m_District;
	@synthesize m_See;
	@synthesize m_City;
	@synthesize m_Play;
	@synthesize m_Understand;
/**
 * The initializer for NorthwindEntities accepting service URI
 */
- (id) init
{
	NSString* tmpuri =[[NSString alloc]initWithString:DEFAULT_SERVICE_URL];
	self=[self initWithUri:tmpuri credential:nil];
	[tmpuri release];
	return self;
}

- (id) initWithUri:(NSString*)anUri credential:(id)acredential
{
	NSString* tmpuri=nil;
	if([anUri length]==0)
	{
	 	tmpuri = DEFAULT_SERVICE_URL;
	}
	else
	{
		tmpuri =[NSString stringWithString:anUri];
	}
	if(![tmpuri hasSuffix:@"/"])
	{
		tmpuri=[tmpuri stringByAppendingString:@"/"];
	}

	if(self=[super initWithUri:tmpuri credentials:acredential dataServiceVersion:DataServiceVersion])
	{
		[super setServiceNamespace:@"NorthwindModel"];

		NSMutableArray* tempEntities=[[NSMutableArray alloc]init];
		
		[tempEntities addObject:@"District"];
		[tempEntities addObject:@"See"];
		[tempEntities addObject:@"City"];
		[tempEntities addObject:@"Play"];
		[tempEntities addObject:@"Understand"];

		if([tempEntities count] > 0 )
		{
			[super setEntitiesWithArray:tempEntities];
		}
		[tempEntities release];

		NSMutableArray* tempEntitiySetKey=[[NSMutableArray alloc]init];
		
		[tempEntitiySetKey addObject:@"district"];
		[tempEntitiySetKey addObject:@"see"];
		[tempEntitiySetKey addObject:@"city"];
		[tempEntitiySetKey addObject:@"play"];
		[tempEntitiySetKey addObject:@"understand"];

		NSMutableArray* tempEntitiyTypeobj=[[NSMutableArray alloc]init];
		
		[tempEntitiyTypeobj addObject:@"District"];
		[tempEntitiyTypeobj addObject:@"See"];
		[tempEntitiyTypeobj addObject:@"City"];
		[tempEntitiyTypeobj addObject:@"Play"];
		[tempEntitiyTypeobj addObject:@"Understand"];

		if( ( [tempEntitiySetKey count] > 0 ) && ( [tempEntitiyTypeobj count] > 0 ) )
		{
			[super setEntitySet2TypeWithObject:tempEntitiyTypeobj forKey:tempEntitiySetKey];

		}

		[tempEntitiySetKey release];
		[ tempEntitiyTypeobj release];

		NSMutableArray* tempEntitiyTypeKey=[[NSMutableArray alloc]init];
		
		[tempEntitiyTypeKey addObject:@"district"];
		[tempEntitiyTypeKey addObject:@"see"];
		[tempEntitiyTypeKey addObject:@"city"];
		[tempEntitiyTypeKey addObject:@"play"];
		[tempEntitiyTypeKey addObject:@"understand"];
		NSMutableArray* tempEntitySetObj=[[NSMutableArray alloc]init];
		
		[tempEntitySetObj addObject:@"District"];
		[tempEntitySetObj addObject:@"See"];
		[tempEntitySetObj addObject:@"City"];
		[tempEntitySetObj addObject:@"Play"];
		[tempEntitySetObj addObject:@"Understand"];

		if( ( [tempEntitiyTypeKey count] > 0 ) && ( [tempEntitySetObj count] > 0 ) )
		{
			[super setEntityType2SetWithObject:tempEntitySetObj forKey:tempEntitiyTypeKey];

		}
    	[tempEntitiyTypeKey release];
		[tempEntitySetObj release];

		NSMutableArray* foreignKeys=[[NSMutableArray alloc]init];		
		[foreignKeys addObject:@"FK_District_City"];
		[foreignKeys addObject:@"FK_See_City"];
		[foreignKeys addObject:@"FK_Play_City"];
		[foreignKeys addObject:@"FK_Understand_City"];

		NSMutableArray *arrOfDictionaries=[[NSMutableArray alloc]initWithCapacity:[foreignKeys count]];

		NSMutableArray *arr;
 
		arr=[[NSMutableArray alloc]init];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"District",@"EndRole",@"District",@"Type",@"*",@"Multiplicity",nil] autorelease]];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"City",@"EndRole",@"City",@"Type",@"0..1",@"Multiplicity",nil] autorelease]];
		[arrOfDictionaries addObject:arr];
		[arr release];


		arr=[[NSMutableArray alloc]init];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"See",@"EndRole",@"See",@"Type",@"*",@"Multiplicity",nil] autorelease]];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"City",@"EndRole",@"City",@"Type",@"0..1",@"Multiplicity",nil] autorelease]];
		[arrOfDictionaries addObject:arr];
		[arr release];


		arr=[[NSMutableArray alloc]init];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"Play",@"EndRole",@"Play",@"Type",@"*",@"Multiplicity",nil] autorelease]];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"City",@"EndRole",@"City",@"Type",@"0..1",@"Multiplicity",nil] autorelease]];
		[arrOfDictionaries addObject:arr];
		[arr release];


		arr=[[NSMutableArray alloc]init];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"Understand",@"EndRole",@"Understand",@"Type",@"*",@"Multiplicity",nil] autorelease]];
		[arr addObject:[[[NSDictionary alloc]initWithObjectsAndKeys:@"City",@"EndRole",@"City",@"Type",@"0..1",@"Multiplicity",nil] autorelease]];
		[arrOfDictionaries addObject:arr];
		[arr release];

		if( ( [foreignKeys count] > 0 ) && ( [arrOfDictionaries count] > 0 ) )
		{
			[super setAssociationforObjects:arrOfDictionaries forKeys:foreignKeys];
		}
		[foreignKeys release];
		[arrOfDictionaries release];

		m_District = [[DataServiceQuery alloc]initWithUri:@"District" objectContext: self];
		m_See = [[DataServiceQuery alloc]initWithUri:@"See" objectContext: self];
		m_City = [[DataServiceQuery alloc]initWithUri:@"City" objectContext: self];
		m_Play = [[DataServiceQuery alloc]initWithUri:@"Play" objectContext: self];
		m_Understand = [[DataServiceQuery alloc]initWithUri:@"Understand" objectContext: self];
		
	}
	return self;
}


/**
 * Method returns DataServiceQuery reference for
 * the entityset District
 */
- (id) district
{
	[self.m_District clearAllOptions];
	return self.m_District;
}

/**
 * Method returns DataServiceQuery reference for
 * the entityset See
 */
- (id) see
{
	[self.m_See clearAllOptions];
	return self.m_See;
}

/**
 * Method returns DataServiceQuery reference for
 * the entityset City
 */
- (id) city
{
	[self.m_City clearAllOptions];
	return self.m_City;
}

/**
 * Method returns DataServiceQuery reference for
 * the entityset Play
 */
- (id) play
{
	[self.m_Play clearAllOptions];
	return self.m_Play;
}

/**
 * Method returns DataServiceQuery reference for
 * the entityset Understand
 */
- (id) understand
{
	[self.m_Understand clearAllOptions];
	return self.m_Understand;
}

/**
 * Methods for adding object to the entityset/collection
 */

- (void) addToDistrict:(id)anObject
{
	[super addObject:@"District" object:anObject];
}

- (void) addToSee:(id)anObject
{
	[super addObject:@"See" object:anObject];
}

- (void) addToCity:(id)anObject
{
	[super addObject:@"City" object:anObject];
}

- (void) addToPlay:(id)anObject
{
	[super addObject:@"Play" object:anObject];
}

- (void) addToUnderstand:(id)anObject
{
	[super addObject:@"Understand" object:anObject];
}

- (void) dealloc
{
	[ m_OData_etag release];
	m_OData_etag = nil;
	
	[m_District release];
	m_District = nil;
	[m_See release];
	m_See = nil;
	[m_City release];
	m_City = nil;
	[m_Play release];
	m_Play = nil;
	[m_Understand release];
	m_Understand = nil;

	[super dealloc];
}

@end
/**
 * @interface:District
 * @key:id
 */
@implementation NorthwindModel_District
	@synthesize m_understand;
	@synthesize m_name;
	@synthesize m_id;
	@synthesize m_city;

/**
 *Method to create an instance of District
 */
+ (id) CreateDistrict
{
	NorthwindModel_District *aDistrict = [[NorthwindModel_District alloc]init];
	return aDistrict;
}
/**
 * Initialising object for District
 */
- (id) init
{
	self=[self initWithUri:nil];
	return self;
}

- (id) initWithUri:(NSString*)anUri 
{
	if(self=[super initWithUri:anUri])
	{
		[self setBaseURI:anUri];
		m_OData_hasStream.booleanvalue=NO;
		[m_OData_entityMap setObject:@"City" forKey:@"city"];
		mProperties *obj;
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_understand"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_name"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_id"];
		[obj release];
		
		[m_OData_entityFKRelation setObject:@"FK_District_City" forKey:@"City"];

		NSMutableArray *anEntityKey=[[NSMutableArray alloc]init];
		[anEntityKey addObject:@"id"];
		[m_OData_entityKey setObject:anEntityKey forKey:@"District"];
		[anEntityKey release];
	}
	return self;
}

-(NSMutableArray *)getSyndicateArray
{
	NSMutableArray *syndicateArray=[[NSMutableArray alloc]init];
	
	return [syndicateArray autorelease];
}
-(NorthwindModel_District *)getDeepCopy
{
	NorthwindModel_District *obj=[[NorthwindModel_District alloc]initWithUri:[self getBaseURI]];
	[obj setunderstand:[self getunderstand]];
	[obj setname:[self getname]];
	[obj setid:[self getid]];
	[obj setcity:[self getcity]];

	return [obj autorelease];
}
- (void) dealloc
{
	[m_understand release];
	m_understand = nil;
	[m_name release];
	m_name = nil;
	[m_id release];
	m_id = nil;
	
	[m_city release];
	m_city = nil;
	[super dealloc];
}

@end
/**
 * @interface:See
 * @key:id
 */
@implementation NorthwindModel_See
	@synthesize m_id;
	@synthesize m_placeName;
	@synthesize m_intro;
	@synthesize m_city;

/**
 *Method to create an instance of See
 */
+ (id) CreateSee
{
	NorthwindModel_See *aSee = [[NorthwindModel_See alloc]init];
	return aSee;
}
/**
 * Initialising object for See
 */
- (id) init
{
	self=[self initWithUri:nil];
	return self;
}

- (id) initWithUri:(NSString*)anUri 
{
	if(self=[super initWithUri:anUri])
	{
		[self setBaseURI:anUri];
		m_OData_hasStream.booleanvalue=NO;
		[m_OData_entityMap setObject:@"City" forKey:@"city"];
		mProperties *obj;
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_id"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"255" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_placeName"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_intro"];
		[obj release];
		
		[m_OData_entityFKRelation setObject:@"FK_See_City" forKey:@"City"];

		NSMutableArray *anEntityKey=[[NSMutableArray alloc]init];
		[anEntityKey addObject:@"id"];
		[m_OData_entityKey setObject:anEntityKey forKey:@"See"];
		[anEntityKey release];
	}
	return self;
}

-(NSMutableArray *)getSyndicateArray
{
	NSMutableArray *syndicateArray=[[NSMutableArray alloc]init];
	
	return [syndicateArray autorelease];
}
-(NorthwindModel_See *)getDeepCopy
{
	NorthwindModel_See *obj=[[NorthwindModel_See alloc]initWithUri:[self getBaseURI]];
	[obj setid:[self getid]];
	[obj setplaceName:[self getplaceName]];
	[obj setintro:[self getintro]];
	[obj setcity:[self getcity]];

	return [obj autorelease];
}
- (void) dealloc
{
	[m_id release];
	m_id = nil;
	[m_placeName release];
	m_placeName = nil;
	[m_intro release];
	m_intro = nil;
	
	[m_city release];
	m_city = nil;
	[super dealloc];
}

@end
/**
 * @interface:City
 * @key:id
 */
@implementation NorthwindModel_City
	@synthesize m_url;
	@synthesize m_id;
	@synthesize m_name;
	@synthesize m_location;
	@synthesize m_sees;
	@synthesize m_understands;
	@synthesize m_plays;
	@synthesize m_districts;

/**
 *Method to create an instance of City
 */
+ (id) CreateCity
{
	NorthwindModel_City *aCity = [[NorthwindModel_City alloc]init];
	return aCity;
}
/**
 * Initialising object for City
 */
- (id) init
{
	self=[self initWithUri:nil];
	return self;
}

- (id) initWithUri:(NSString*)anUri 
{
	if(self=[super initWithUri:anUri])
	{
		[self setBaseURI:anUri];
		m_OData_hasStream.booleanvalue=NO;
		[m_OData_entityMap setObject:@"See" forKey:@"sees"];
		[m_OData_entityMap setObject:@"Understand" forKey:@"understands"];
		[m_OData_entityMap setObject:@"Play" forKey:@"plays"];
		[m_OData_entityMap setObject:@"District" forKey:@"districts"];
		mProperties *obj;
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_url"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_id"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_name"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_location"];
		[obj release];
		
		[m_OData_entityFKRelation setObject:@"FK_See_City" forKey:@"See"];
		[m_OData_entityFKRelation setObject:@"FK_Understand_City" forKey:@"Understand"];
		[m_OData_entityFKRelation setObject:@"FK_Play_City" forKey:@"Play"];
		[m_OData_entityFKRelation setObject:@"FK_District_City" forKey:@"District"];

		NSMutableArray *anEntityKey=[[NSMutableArray alloc]init];
		[anEntityKey addObject:@"id"];
		[m_OData_entityKey setObject:anEntityKey forKey:@"City"];
		[anEntityKey release];
	}
	return self;
}

-(NSMutableArray *)getSyndicateArray
{
	NSMutableArray *syndicateArray=[[NSMutableArray alloc]init];
	
	return [syndicateArray autorelease];
}
-(NorthwindModel_City *)getDeepCopy
{
	NorthwindModel_City *obj=[[NorthwindModel_City alloc]initWithUri:[self getBaseURI]];
	[obj seturl:[self geturl]];
	[obj setid:[self getid]];
	[obj setname:[self getname]];
	[obj setlocation:[self getlocation]];
	[obj setsees:[self getsees]];
	[obj setunderstands:[self getunderstands]];
	[obj setplays:[self getplays]];
	[obj setdistricts:[self getdistricts]];

	return [obj autorelease];
}
- (void) dealloc
{
	[m_url release];
	m_url = nil;
	[m_id release];
	m_id = nil;
	[m_name release];
	m_name = nil;
	[m_location release];
	m_location = nil;
	
	[m_sees release];
	m_sees = nil;
	[m_understands release];
	m_understands = nil;
	[m_plays release];
	m_plays = nil;
	[m_districts release];
	m_districts = nil;
	[super dealloc];
}

@end
/**
 * @interface:Play
 * @key:id
 */
@implementation NorthwindModel_Play
	@synthesize m_location;
	@synthesize m_explane;
	@synthesize m_id;
	@synthesize m_tpy;
	@synthesize m_city;

/**
 *Method to create an instance of Play
 */
+ (id) CreatePlay
{
	NorthwindModel_Play *aPlay = [[NorthwindModel_Play alloc]init];
	return aPlay;
}
/**
 * Initialising object for Play
 */
- (id) init
{
	self=[self initWithUri:nil];
	return self;
}

- (id) initWithUri:(NSString*)anUri 
{
	if(self=[super initWithUri:anUri])
	{
		[self setBaseURI:anUri];
		m_OData_hasStream.booleanvalue=NO;
		[m_OData_entityMap setObject:@"City" forKey:@"city"];
		mProperties *obj;
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_location"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_explane"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_id"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_tpy"];
		[obj release];
		
		[m_OData_entityFKRelation setObject:@"FK_Play_City" forKey:@"City"];

		NSMutableArray *anEntityKey=[[NSMutableArray alloc]init];
		[anEntityKey addObject:@"id"];
		[m_OData_entityKey setObject:anEntityKey forKey:@"Play"];
		[anEntityKey release];
	}
	return self;
}

-(NSMutableArray *)getSyndicateArray
{
	NSMutableArray *syndicateArray=[[NSMutableArray alloc]init];
	
	return [syndicateArray autorelease];
}
-(NorthwindModel_Play *)getDeepCopy
{
	NorthwindModel_Play *obj=[[NorthwindModel_Play alloc]initWithUri:[self getBaseURI]];
	[obj setlocation:[self getlocation]];
	[obj setexplane:[self getexplane]];
	[obj setid:[self getid]];
	[obj settpy:[self gettpy]];
	[obj setcity:[self getcity]];

	return [obj autorelease];
}
- (void) dealloc
{
	[m_location release];
	m_location = nil;
	[m_explane release];
	m_explane = nil;
	[m_id release];
	m_id = nil;
	[m_tpy release];
	m_tpy = nil;
	
	[m_city release];
	m_city = nil;
	[super dealloc];
}

@end
/**
 * @interface:Understand
 * @key:id
 */
@implementation NorthwindModel_Understand
	@synthesize m_visitTime;
	@synthesize m_id;
	@synthesize m_today;
	@synthesize m_history;
	@synthesize m_city;

/**
 *Method to create an instance of Understand
 */
+ (id) CreateUnderstand
{
	NorthwindModel_Understand *aUnderstand = [[NorthwindModel_Understand alloc]init];
	return aUnderstand;
}
/**
 * Initialising object for Understand
 */
- (id) init
{
	self=[self initWithUri:nil];
	return self;
}

- (id) initWithUri:(NSString*)anUri 
{
	if(self=[super initWithUri:anUri])
	{
		[self setBaseURI:anUri];
		m_OData_hasStream.booleanvalue=NO;
		[m_OData_entityMap setObject:@"City" forKey:@"city"];
		mProperties *obj;
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"255" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_visitTime"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.Int32" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_id"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_today"];
		[obj release];
		
		obj=[[mProperties alloc]initWithEdmType:@"Edm.String" MaxLength:@"" MinLength:@"" FixedLength:NO Nullable:YES Unicode:NO ConcurrencyMode:@"" FC_TargetPath:@"" FC_KeepInContent:YES FC_SourcePath:@"" FC_ContentKind:@"" FC_NsPrefix:@"" FC_NsUri:@""];
		[m_OData_propertiesMap setObject:obj forKey:@"m_history"];
		[obj release];
		
		[m_OData_entityFKRelation setObject:@"FK_Understand_City" forKey:@"City"];

		NSMutableArray *anEntityKey=[[NSMutableArray alloc]init];
		[anEntityKey addObject:@"id"];
		[m_OData_entityKey setObject:anEntityKey forKey:@"Understand"];
		[anEntityKey release];
	}
	return self;
}

-(NSMutableArray *)getSyndicateArray
{
	NSMutableArray *syndicateArray=[[NSMutableArray alloc]init];
	
	return [syndicateArray autorelease];
}
-(NorthwindModel_Understand *)getDeepCopy
{
	NorthwindModel_Understand *obj=[[NorthwindModel_Understand alloc]initWithUri:[self getBaseURI]];
	[obj setvisitTime:[self getvisitTime]];
	[obj setid:[self getid]];
	[obj settoday:[self gettoday]];
	[obj sethistory:[self gethistory]];
	[obj setcity:[self getcity]];

	return [obj autorelease];
}
- (void) dealloc
{
	[m_visitTime release];
	m_visitTime = nil;
	[m_id release];
	m_id = nil;
	[m_today release];
	m_today = nil;
	[m_history release];
	m_history = nil;
	
	[m_city release];
	m_city = nil;
	[super dealloc];
}

@end