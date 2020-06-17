# Introduction to Data Storage in Azure Supplemental Guide

This is a supplemental resource to the Intro to Data Storage in Azure presentation. It includes the workshop demo and resources to learn more.

## Summary

- The cloud is a popular option for data storage because it manages some of the work it takes to keep you data secure, backed up and accessible to end users during fluctuations in traffic.
- Considering Azure for data? It's easy to integrate with other Azure services and has many options for your data [learn more](#learn-more)
- Focus on your data with the tools you love

## Assessing your data

- What is the structure of your data?​
- How much data will you be working with?​
- Is having some of your data on premise important to you?​
- What tools or services depend on your data right now?​
- Will this data be accessed by many?

## Demo

We'll be using a data source to do a basic aggregation on a dataset from the [Azure Open Datasets Catalog](https://azure.microsoft.com/en-us/services/open-datasets/catalog/) on [COVID-19 Data Lake/Bing COVID-19 Data](https://azure.microsoft.com/en-us/services/open-datasets/catalog/bing-covid-19-data/). We'll be converting the structure of one of these data sets to another with Azure Data factory and using Azure Notebooks to view the data and form our query with [Pandas](https://pandas.pydata.org/).

## Prerequisites

- Azure Account

## Instructions

### Create Azure Services
1. Click this button to create a Storage Account, Azure SQL database, and Data Factory 
   
 [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpaladique%2FWorkshop-DataInAzure%2Fmaster%2Ftemplate%2FdeployTemplate.json)
   
   *Recommended: Once your Azure resources are deployed, pin it to your dashboard in the Azure Portal*

2. Download [this JSON file](https://pandemicdatalake.blob.core.windows.net/public/curated/covid-19/bing_covid-19_data/latest/bing_covid-19_data.json)

### Setup Azure Services

3. Go to the Azure portal and open your new Storage Account. It should start with `storage`, you can use the search window at the top of dashboard.
4. On the left, open **Containers**
5. Select the container labeled `semi-structured-data` > **Upload**. Upload the JSON file and `db-demo.bacpac` (in the template folder) to the the blob container. It should be the only one. [How to upload a blob to your container](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal#upload-a-block-blob)
6. In the Azure portal, open your Azure SQL Server (starts with `sqlserver-`).
   *1. You might need to add a firewall rule for your ip address. Go to Firewalls and Virtual Networks and click **+ Add client IP***
7. In the Overview section of Azure SQL Server, select **Import Database** follow the prompts, select your storage account, `semi-structured-data` and the `db-demo.bacpac` file. Set the pricing tier to **Basic** and add a database name and click **Ok** [How to import a BACPAC file to Azure SQL](https://docs.microsoft.com/en-us/azure/azure-sql/database/database-import?tabs=azure-powershell#using-azure-portal)

### Using the Notebook
8. Download/Clone the notebook content in this repo (`notebook-data` folder) and upload all three files to [Azure Notebooks](https://notebooks.azure.com/). 
9.  Edit the configuration file named `myconfig.cfg` with the following:
  
  ```python
[my_db]
server: [your Azure SQL server name]
database: [your Azure SQL database name]
username: [your Azure SQL username]
password: [your Azure SQL password]
  ```

10.  Follow the remaining instructions in the notebook named `Weekly US Infection Rates`

# Cleanup

Locate the name of your resource group and [follow these instructions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/delete-resource-group?tabs=azure-portal#delete-resource-group)

## Learn More

  -  **Structured**
     -  [Azure SQL documentation overview](https://docs.microsoft.com/en-us/azure/azure-sql/) 
        -  [MS Learn Module: Migrate your relational data stored in SQL Server to Azure SQL Database
](https://docs.microsoft.com/en-us/learn/modules/migrate-sql-server-relational-data/)
     -  [Azure DB for MySQL documentation overview](https://docs.microsoft.com/en-us/azure/mysql/) 
        -  [MS Learn Module: Migrate on-premises MySQL databases to Azure Database for MySQL
](https://docs.microsoft.com/en-us/learn/modules/migrate-on-premises-mysql-databases/)
     -  [Azure DB for Postgres documentation overview](https://docs.microsoft.com/en-us/azure/postgresql/) 
        -  [MS Learn Module:Migrate on-premises PostgreSQL databases to Azure Database for PostgreSQL
 ](https://docs.microsoft.com/en-us/learn/modules/migrate-on-premises-postgresql-databases/)
  -  **Unstructured and Semi-structured**
     -  [Storage account (Blobs, files, queues, disks, table, Data Lake) documentation overview](https://docs.microsoft.com/en-us/azure/storage/) 
        -  [MS Learn Modules on Storage Accounts](https://docs.microsoft.com/en-us/learn/browse/?term=azure%20storage)
     -  [Cosmos DB documentation overview](https://docs.microsoft.com/en-us/azure/cosmos-db/) 
        -  [MS Learn Module: Work with NoSQL data in Azure Cosmos DB
 ](https://docs.microsoft.com/en-us/learn/paths/work-with-nosql-data-in-azure-cosmos-db/)
  - **Additional services**
     -  [Azure Data Factory documentation overview](https://docs.microsoft.com/en-us/azure/data-factory/) 
        -  [MS Learn Module: Create production workloads on Azure Databricks with Azure Data Factory
](https://docs.microsoft.com/en-us/learn/modules/create-production-workloads-azure-databricks-azure-data-factory/)
     -  [Azure Stream Analytics documentation overview](https://docs.microsoft.com/en-us/azure/stream-analytics/) 
        -  [Implement a Data Streaming Solution with Azure Streaming Analytics](https://docs.microsoft.com/en-us/learn/paths/implement-data-streaming-with-asa/)
     -  [Azure Databricks documentation overview](https://docs.microsoft.com/en-us/azure/azure-databricks/) 
        -  [MS Learn Module: Read and write data in Azure Databricks](https://docs.microsoft.com/en-us/learn/modules/read-write-data-azure-databricks/)
     -  [Azure Notebooks documentation overview](https://docs.microsoft.com/en-us/azure/notebooks/) 
        -  [MS Learn Module: Introduction to machine learning with Python and Azure Notebooks
](https://docs.microsoft.com/en-us/learn/paths/intro-to-ml-with-python/)

- Info on [REST](https://www.codecademy.com/articles/what-is-rest) 
