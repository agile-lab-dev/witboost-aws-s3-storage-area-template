## Overview

Use this template to automatically create an S3 bucket for a Data Product. If the bucket does not exist, it will be created. Within the bucket, a dedicated folder will be generated for each S3 storage area.

### What’s a Storage Area?

Storage areas are one of the main components for the Data Mesh data platform taxonomy. They allow creating and handling the internal storage systems to manage data the data product needs to work.

## Customizing the Template

To customize this template, modify the `spec.mesh.specific` section inside [`catalog-info.yaml`](./catalog-info.yaml).

⚠ **Modifying fields in the `spec.mesh` section directly is not recommended**, as it may introduce inconsistencies.  
The preferred approach is to create a new component using the wizard.

In case of doubt, please contact the platform team.
