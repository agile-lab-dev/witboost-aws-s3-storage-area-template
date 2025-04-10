# S3 Storage Area Template

This documentation describes the details and parameters required to create an S3 Storage Area within the Witboost platform.

### Prerequisites

A `Data Product` should already exist in order to attach the new components to it.

### Component Basic Information

This section includes the basic information that any Component of Witboost must have:

- **Name**: Required name used for display purposes on your Data Product.
- **Description**: A short description to help others understand what this Storage Area is for.
- **Domain**: The domain of the Data Product this Storage Area belongs to. Be sure to choose it correctly as it is a fundamental part of the Storage Area and cannot be changed afterwards.
- **Data Product**: The Data Product this Storage Area belongs to; be sure to choose the right one.
- **Identifier**: Unique ID for this new entity inside the domain. It will be automatically filled for you.
- **Development group**: Development group of this Data Product. It will be automatically filled for you.
- **Depends on**: If you want your Storage Area to depend on other components from the Data Product, you can choose this option (Optional).
- **Tags**: Tags for the component (Optional).

*Example:*

| Field name            | Example value                                                                                          |
|-----------------------|--------------------------------------------------------------------------------------------------------|
| **Name**              | S3 demo bucket                                                                                         |
| **Description**       | S3 bucket for demo purposes                                                                            |
| **Domain**            | domain:finance                                                                                         |
| **Data Product**      | system:finance.tradingdp.0                                                                             |
| **Identifier**        | Will look something like this: *finance.trading.0.s3-demo-bucket*                                      |
| **Development Group** | Might look something like this: *group:datameshplatform* Depends on the Data Product development group |
| **Depends on**        | []                                                                                                     |
| **Tags**              | \[tag1, tag2\]                                                                                         |


### Storage Area deployment information

This section requires the only essential detail needed to create the bucket: the region.

- **Region**: the geographical location where your bucket’s data will be physically stored.

*Example:*

| **Column Name** | **Description** | 
|-----------------|-----------------|
| Region          | eu-west-1       | 


### Deployment Process

After this, the system will show you the summary of the template, and you can go back and edit or go ahead and create the Component.

After clicking on "Create" the registering of the Component will start. If no errors occur, it will go through the 3 phases (Fetching, Publishing, and Registering) and will provide you with links to the newly created Repository and the component in the Catalog.

Deploying the component if the specified s3 bucket does not exist will be created, otherwise it will be updated.

**Be careful not to delete the `catalog-info.yml` and ensure that the project structure remains as given.**

