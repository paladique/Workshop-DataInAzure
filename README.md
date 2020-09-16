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

The notebook for this demo explores a data source from the [Azure Open Datasets Catalog](https://azure.microsoft.com/en-us/services/open-datasets/catalog/) on [NOAA Integrated Surface Data (ISD)](https://azure.microsoft.com/en-us/services/open-datasets/catalog/noaa-integrated-surface-data). We'll be converting the structure of one of these data sets to another with Azure Data factory and using Azure Machine Learning Studio to view the data and form our query with Python and the [Pandas](https://pandas.pydata.org/) library.

## Prerequisites

- Azure Account

## Instructions

### Create Azure Services
1. Click this button to create a MySQL database, and Data Factory 
   
 [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpaladique%2FWorkshop-DataInAzure%2Fmaster%2Ftemplate%2FdeployTemplate.json)
   
*Recommended: Once your Azure resources are deployed, pin it to your dashboard in the Azure Portal*

### Setup Azure Services

1. In the Azure portal, open your MySQL Server (starts with `mysql-`).
2. Go to **Connection Security** and click **+ Add client IP*** to add a firewall rule for your ip address.
3. Set **Allow access to Azure Services** to **On**.
4. Go back to the **Overview** in MySQL
5. Click on the terminal icon at the top of the portal to open the Cloud Shell Terminal.

#### Set up MySQL database in the Cloud Shell

6. Connect to MySQL with the following command replace the `servername` and `adminname` with the values in the overview of MySQL:

`mysql -h servername.mysql.database.azure.com -u adminname@servername -p`

You're now connected to your MySQL server. The following commands will set up the database and table:

`CREATE DATABASE weather;`
`USE weather;`

```sql
CREATE TABLE surfaceLevelWeather(
    id serial PRIMARY KEY,
    time DATETIME, 
    latitude DOUBLE,
    longitude DOUBLE,
    elevation DOUBLE,
    station VARCHAR(100),
    temperature DOUBLE,
    windSpeed DOUBLE,
    windAngle INT,
    currentWeatherCode INT,
    currentWeather VARCHAR(50)
);
```

### Using the Notebook

Azure Machine Learning Studio will be used to work with the notebook, you may have already completed the creation step. If not refer to the instructions on how to create a [Machine Learning Workspace](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-manage-workspace#create-a-workspace)

7. Download/Clone the notebook content in this repo (`notebook-data` folder)
8. Go to your created Azure Machine Learning service in the Portal > **Launch Now** to open the Machine Learning Studio
9. Go to **Notebooks** > **Start Now**
10. Under **My Files**, select the upload button and upload the entire notebook folder.
11. Edit the configuration file named `myconfig.cfg` and replace the `servername` and `adminname` with the values in the overview of MySQL.

```python
[my_db]
host:servername.mysql.database.azure.com
user:adminname@servername
password: mypassword
database: mydatabase
 ```

12. Follow the remaining instructions in the notebook named `Weather and Elevation`

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
