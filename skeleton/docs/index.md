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

---
## Lifecycle Permanently Delete Configuration

{% if values.permanentlyDeleteEnabled %}
| **Field Name**                           | **Value**                               |
|------------------------------------------|-----------------------------------------|
| **Days after objects become noncurrent** | ${{ values.daysAfterBecomeNonCurrent }} |
| **Number of newer versions to retain**   | ${{ values.numberOfVersionsToRetain }}  |

{% else %} Disabled {% endif %}

---

## Intelligent Tiering Configuration

| **Field Name**                       | **Value**                                            |
|--------------------------------------|------------------------------------------------------|
| **Enabled**                          | ${{ values.intelligentTieringConfigurationEnabled }} |
| **Archive Access Tier Enabled**      | ${{ values.archiveAccessTierEnabled }}               |
| **Archive Access Tier Days**         | ${{ values.archiveAccessTierDays }}                  |
| **Deep Archive Access Tier Enabled** | ${{ values.deepArchiveAccessTierEnabled }}           |
| **Deep Archive Access Tier Days**    | ${{ values.deepArchiveAccessTierDays }}              |


## Deployment details 

Deploy this component to automatically create or update an S3 bucket for the Data Product.




