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

We'll be using two data sources to answer a question: Did reported COVID-19 infection rates increase after national holidays?
We'll be using data from the [Azure Open Datasets Catalog](https://azure.microsoft.com/en-us/services/open-datasets/catalog/) on [Public Holidays](https://azure.microsoft.com/en-us/services/open-datasets/catalog/public-holidays/) and [COVID-19 Data Lake/Bing COVID-19 Data](https://azure.microsoft.com/en-us/services/open-datasets/catalog/bing-covid-19-data/). We'll be converting the structure of one of these data sets to another with Azure Data factory and using Azure Notebooks to view the data and form our query with [Pandas](https://pandas.pydata.org/).

## Prerequisites

- Azure Account

## Instructions

1. Use this template to create a Storage Account, and a Azure SQL database
2. Create a Data Factory in the Azure Portal. Follow the "Create a Data Factory" section in this guide for instructions: [Create A Data Factory](https://docs.microsoft.com/en-us/azure/data-factory/quickstart-create-data-factory-portal#create-a-data-factory)
3. In the Portal, create a blob container.
4. Download [this json file](https://pandemicdatalake.blob.core.windows.net/public/curated/covid-19/bing_covid-19_data/latest/bing_covid-19_data.json) and upload it to the blob container
5. Download the notebook in this repo and upload it to [Azure Notebooks](https://notebooks.azure.com/)
6. Add a configuration file named `myconfig.cfg` with the following:
  
  ```python
[my_db]
server: [your Azure SQL server name]
database: [your Azure SQL database name]
username: [your Azure SQL username]
password: [your Azure SQL password]
  ```

7. Follow the remaining instructions in the notebook.

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
  - ** Additional services**
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
