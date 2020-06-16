# Introduction to Data Storage in Azure Supplemental Guide

This is a supplemental resource to the Intro to Data Storage in Azure presentation. It includes the workshop demo and resources to learn more.

## Summary

- The cloud is a popular option for data storage because it manages some of the work it takes to keep you data secure, backed up and accessible to end users during fluctuations in traffic.
- Considering Azure for data? It's easy to integrate with other Azure services and has many options for your data:
  -  Structured
  -  Unstructured
  -  Additional services
- Focus on your data with the tools you love

## Assessing your data

- What is the structure of your data?​

- How much data will you be working with?​

- Is having some of your data on premise important to you?​

- What tools or services depend on your data right now?​

- Will this data be accessed by many?

## Prerequisites 

1. Create an Azure Storage Account
2. Create a Cosmos DB account
3. Create an Azure Data Factory account

## Table of Contents (?)

This covers popular data storage services on Azure, including

- Azure Storage and Data Lake
- Data Factory
- Data Lake
- Cosmos DB
- Azure SQL

This also covers services that easily integrate with the above services
- stream analytics

## Azure Storage Account

- Multiple options for storage under one account
  - Blobs (Binary Large Objects)
  - Files
  - Disks
  - Queues
  - Table
  - Data Lake
- Accessible via multiple SDKs and REST

### Create a file share

*A file share is a fast and straightforward way to share files with a physical machine. Creating a file share in Azure starts with the storage account.*

In this activity we will:
    1. Create a file share in our storage account
    2. Mount the file share on a local machine
    3. Transfer files into the file share
    4. (Optional) Access files via REST

### Learn More about Storage Accounts

- Overview Link
- Docs Link
- Cheat/Tips/Best practice sheet if any
- Learn Link

## Azure Data Factory (ADF)

- Schedule jobs for data movement
- Choose from multiple sources and destinations that can be external or existing Azure resources

## Export data from one source to multiple destinations

In this activity we will:
    1. Locate the CSV file we uploaded from the [file share](#create-a-file-share) and import it
    2. Preview the CSV data
    3. Import the CSV data into AzureSQL and Cosmos DB

### Learn More about ADF

- Overview Link
- Docs Link
- Cheat/Tips/Best practice sheet if any
- Learn Link

## Azure Data Lake Storage (Gen 2)

https://docs.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-abfs-driver

### Learn More about Data Lake

- Overview Link
- Docs Link
- Cheat/Tips/Best practice sheet if any
- Learn Link

## Cosmos DB

- Multi-model NoSQL
  - SQL API
  - MongoDB
  - Gremlin
  - Cassandra
- Replicate data globally with the click of a button

### Create a notebook with Cosmos DB data [***Reference](https://docs.microsoft.com/en-us/azure/cosmos-db/enable-notebooks#create-and-run-your-first-notebook)

*Cosmos DB comes with Jupyter Notebooks support built in* *

`*Built-in notebooks for Azure Cosmos DB are currently available in the following Azure regions: Australia East, East US, East US 2, North Europe, South Central US, Southeast Asia, UK South, West Europe and West US 2.`

In this activity we will:
    1. Review basic metrics in Cosmos DB
    2. Enable notebooks in Cosmos DB
    3. Create and run a notebook from imported data from [Azure Data Factory](#export-data-from-one-source-to-multiple-destinations)

### Learn More about Cosmos DB

- Overview Link
- Docs Link
- Cheat/Tips/Best practice sheet if any
- Learn Link

## Azure SQL

- Relational data in the cloud
- Build in performance and security recommendations.

## Using the Spark Connector with Azure SQL (Possibly? Sounds like a lot)

*Azure SQL can be integrated with Spark as a input data source or output data sink for Spark jobs. This is done through the [Spark to SQL DB connector](https://github.com/Azure/azure-sqldb-spark).*

In this activity we will:
1. 

### Learn More about Azure SQL and other relational database services on Azure

- Overview Link
- Docs Link
- Cheat/Tips/Best practice sheet if any
- Learn Link

## Azure Databricks

### Learn More

- Overview Link
- Docs Link
- Cheat/Tips/Best practice sheet if any
- Learn Link

## Azure Stream Analytics

### Learn More about Stream Analytics

- Overview Link
- Docs Link
- Cheat/Tips/Best practice sheet if any
- Learn Link

