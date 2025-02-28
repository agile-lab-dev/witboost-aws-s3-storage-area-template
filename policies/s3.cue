import "strings"

let splits = strings.Split(id, ":")
let domain = splits[3]
let majorVersion = splits[5]

#ComponentVersion: string & =~"^([0-9]+\\.[0-9]+\\..+)$"
#Id:               string & =~"^[a-zA-Z0-9:._\\-]+$"
#ComponentId:      #Id & =~"^urn:dmb:cmp:\(domain):[a-zA-Z0-9_\\-]+:\(majorVersion):[a-zA-Z0-9_\\-]+$"
#AWSRegion: 			 string & =~"(?i)^(eu-west-1|eu-west-2|eu-west-3|eu-central-1|eu-north-1|eu-south-1|eu-south-2|eu-central-2)$"


#OM_Tag: {
	tagFQN:       string & =~"^[a-zA-Z0-9 +=._:/@-]+$"
	description?: string | null
	source:       string & =~"(?i)^(Tag|Glossary)$"
	labelType:    string & =~"(?i)^(Manual|Propagated|Automated|Derived)$"
	state:        string & =~"(?i)^(Suggested|Confirmed)$"
	href?:        string | null
}

#LifeCycleConfiguration: {
	permanentlyDelete: null | #PermanentlyDelete
}

#IntelligentTieringConfiguration: {
	enabled!:                       bool
	archiveAccessTierEnabled!: 	bool
	archiveAccessTierDays: 		int & >=90 & <=730
	deepArchiveAccessTierEnabled!: 	bool
	deepArchiveAccessTierDays: 	int & >=180 & <=730
}

#PermanentlyDelete: {
	daysAfterBecomeNonCurrent: 	int & >0
	numberOfVersionsToRetain: 	int & >=1 & <=100
}

#BucketTag: {
	key!:   string & =~"^[a-zA-Z0-9 +=._:/@-]+$"
	value!: string & =~"^[a-zA-Z0-9 +=._:/@-]+$"
}

#S3Specific: {
	region:   #AWSRegion
	serverSideEncryption!: string & =~"^(AES256|AWS_KMS)$"
	multipleVersion: bool
	lifeCycleConfiguration!: #LifeCycleConfiguration
	intelligentTieringConfiguration!: #IntelligentTieringConfiguration
	bucketTag: [...#BucketTag]
}

id:                       #ComponentId
name:                     string
fullyQualifiedName?:      null | string
description:              string
kind:                     string & =~"(?i)^(storage)$"
version:                  #ComponentVersion
infrastructureTemplateId: string
useCaseTemplateId?:       null | string
dependsOn?: 							[...#ComponentId]
platform:        					string & =~"(?i)^(AWS)$"
technology:      					string & =~"(?i)^(S3)$"
storageType:    					string & =~"(?i)^(Files)$"
tags: 										[...#OM_Tag]
specific: 								#S3Specific
...
