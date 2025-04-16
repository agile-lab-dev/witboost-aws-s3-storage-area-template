# ${{ values.name | dump }}

- [Overview](#overview)
- [Customise template](#customise-template)
- [Usage](#usage)

## Overview
Use this template to automatically manage an S3 bucket for a Data Product. If the bucket does not exist will be created, otherwise it will be updated.

### What's a Storage area?
A Storage Area is what the components of a Data Product use to persist data that is created or used by the various Workloads or served by Output Ports.

## Customise template
To customise this template, modify the `spec.mesh.specific` section inside [catalog-info.yaml](./catalog-info.yaml).
**It is not recommended** to edit the fields above `spec.mesh section`, as inconsistencies may be generated.
The best solution is to create a new component using the wizard.
In case of doubt, please contact the platform team.

### `spec.mesh.specific` – Customizable Fields for AWS S3 Bucket

- **region**: AWS region where the S3 bucket will be created. ⚠️ Immutable after first deployment.

- **serverSideEncryption**: Encryption method for data at rest. Allowed values: `AES256`, `AWS_KMS`.

- **multipleVersion**: \[Optional\] Whether S3 versioning is enabled. Type: `boolean`

- **lifeCycleConfiguration**: Defines automatic lifecycle rules for object versions.
  - **permanentlyDelete**: \[Optional\] Enables automatic deletion of non-current versions. 
    - **daysAfterBecomeNonCurrent**: Days after which non-current versions are deleted. **Required if `permanentlyDelete` is set**.  
      Allowed values: integer > 0
    - **numberOfVersionsToRetain**: How many non-current versions to keep. **Required if `permanentlyDelete` is set**.  
      Allowed values: 1–100

- **intelligentTieringConfiguration**: Enables S3 Intelligent-Tiering archive tiers for cost optimization. 
  - **archiveAccessTierEnabled**: Enables Archive Access tier. 
    Type: `boolean`
  - **archiveAccessTierDays**: Days before transition to Archive Access. **Required if enabled**.  
    Allowed values: 90–730
  - **deepArchiveAccessTierEnabled**: Enables Deep Archive tier. 
    Type: `boolean`
  - **deepArchiveAccessTierDays**: Days before transition to Deep Archive. **Required if enabled**.  
    Allowed values: 180–730

- **bucketTags**: \[Optional\] List of custom tags to attach to the S3 bucket. 
  Each tag must include:
  - **key** 
  - **value** 

## Usage

To get information about this component and how to use it, refer to this [document](./docs/index.md).



