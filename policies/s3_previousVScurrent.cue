import "strings"
import "list"


#Component: {
	kind: string & =~"(?i)^(outputport|workload|storage|observability)$"
	useCaseTemplateId:        string
	infrastructureTemplateId: string
	if kind != _|_ {
		if kind =~ "(?i)^(storage)$" && useCaseTemplateId == "urn:dmb:utm:aws-s3-template:0.0.0" {
			#Storage
		}
	}
	...
}

#Storage: {
	id: string
	specific: {
		region!: string
		multipleVersion: bool
	}
	...
}


original: {
  components: [...#Component]
  ...
}

current: {
  components: [...#Component]
  ...
}


_checks: {

		originalS3Storages: [for n in original.components if n.kind == "storage" && n.useCaseTemplateId == "urn:dmb:utm:aws-s3-template:0.0.0" {
			id: 			n.id
			region: 	n.specific.region
		}]

		currentS3Storages: [for n in current.components if n.kind == "storage" && n.useCaseTemplateId == "urn:dmb:utm:aws-s3-template:0.0.0" {
			id: 			n.id
			region: 	n.specific.region
		}]

		mismatchStorages: [for missing in originalS3Storages if !list.Contains(currentS3Storages, missing) {missing}]
		_checkMismatchStorages: len(mismatchStorages) & <=0
}