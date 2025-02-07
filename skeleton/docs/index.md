## Component Basic Information

| Field Name              | Example Value                  |
|:------------------------|:-------------------------------|
| **Name**                | ${{ values.name }}             |
| **Description**         | ${{ values.description }}      |
| **Domain**              | ${{ values.domain }}           |
| **Data Product**        | ${{ values.dataproduct }}      |
| **_Identifier_**        | ${{ values.identifier }}       |
| **_Development Group_** | ${{ values.developmentGroup }} |
| **Depends On**          | ${{ values.dependsOn }}        |
| **Platform**            | S3 on AWS                      |
| **Technology**          | S3                             |
| **Tags**                | {% if values.tags | length > 0 %}{% for i in values.tags %} ${{ i }}; {% endfor %}{% else %}[]{% endif %}      |


## S3 Details

| **Field Name**         | **Value**                     |
|------------------------|-------------------------------|
| **Region**             | ${{ values.region }}          |
| **Multiple versions ** | ${{ values.multipleVersion }} |


## Deployment details 

Deploy this component to automatically create an S3 bucket for the Data Product if it does not already exist.
A dedicated folder for this storage area will be created within the bucket.




