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

The notebook for this demo explores a data source from the [Azure Open Datasets Catalog](https://azure.microsoft.com/services/open-datasets/catalog/?WT.mc_id=academic-0000-jasmineg) on [NOAA Integrated Surface Data (ISD)](https://azure.microsoft.com/services/open-datasets/catalog/noaa-integrated-surface-data?WT.mc_id=academic-0000-jasmineg). We'll be converting the structure of one of these data sets to another with Azure Data factory and using Azure Machine Learning Studio to view the data and form our query with Python and the [Pandas](https://pandas.pydata.org/) library.

## Prerequisites

- Azure Account

## Instructions

### Create Azure Services
1. Click this button to create a MySQL database, and Data Factory 
   
 [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/?WT.mc_id=academic-0000-jasmineg#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpaladique%2FWorkshop-DataInAzure%2Fmaster%2Ftemplate%2FdeployTemplate.json)
   
*Recommended: Once your Azure resources are deployed, pin it to your dashboard in the Azure Portal*

### Setup Azure Services

1. In the Azure portal, open your MySQL Server (starts with `mysql-`).
2. Go to **Connection Security** and click **+ Add client IP*** to add a firewall rule for your ip address.
3. Set **Allow access to Azure Services** to **On**.
4. Go back to the **Overview** in MySQL
5. Click on the terminal icon at the top of the portal to open the Cloud Shell Terminal.

#### Set up MySQL database in the Cloud Shell
To connect to MySQL, you'll need a cerfiticate to communicate over SSL with your database. The certificate used in this demo [is recommended by Microsoft](https://docs.microsoft.com/azure/mysql/howto-configure-ssl?WT.mc_id=academic-0000-jasmineg#step-1-obtain-ssl-certificate). _It is recommended to use the new certificate, named `DigiCertGlobalRootG2.crt.pem` as the old one will expire on February 15th_

6. Download the SSL certificate: https://cacerts.digicert.com/DigiCertGlobalRootG2.crt.pem 
7. Upload the downloaded certificate to your cloud shell (confirm it's uploaded with ls). [Here's instructions on how to upload](https://docs.microsoft.com/azure/cloud-shell/using-the-shell-window?WT.mc_id=academic-0000-jasmineg#upload-and-download-files)
8. Connect to MySQL with the following command. Replace the `servername` and `adminname` with the values in the overview of MySQL:

`mysql -h servername.mysql.database.azure.com -u adminname@servername -p --ssl-ca=DigiCertGlobalRootG2.crt.pem`

You're now connected to your MySQL server. The following commands will set up the database and table:

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

Azure Machine Learning Studio will be used to work with the notebook, you may have already completed the creation step. If not refer to the instructions on how to create a [Machine Learning Workspace](https://docs.microsoft.com/azure/machine-learning/how-to-manage-workspace?WT.mc_id=academic-0000-jasmineg#create-a-workspace).

9. Download/Clone the notebook content in this repo (`notebook-data` folder)
10. Go to your created Azure Machine Learning service in the Portal > **Launch Now** to open the Machine Learning Studio
11. Go to **Notebooks** > **Start Now**
12. Under **My Files**, select the upload folder button (4th button from the left) and upload the entire notebook folder.
13. Open and edit the configuration file named `myconfig.cfg` and replace the `servername` and `adminname` with the values in the overview of MySQL from the Portal.

```python
[my_db]
host:servername.mysql.database.azure.com
user:adminname@servername
password: mypassword
database: mydatabase
 ```

14. Create a compute instance to run the notebook: in the Compute section, above of the notebook, select the **+** to open the **New compute instance** form.
15. Select a compute name and change the virtual machine size to `Standard_D1 `, then select **Create**. CPU and Region can stay at their default settings.
16. Select the created instance from the compute dropdown, it may take a minute or two to create. Select the the Play/Start Compute button to start the instance.
17. When the computer instance enters a `Running` state, select `Python 3.6 - Azure ML` as the Jupyter kernel.
18.   Follow the remaining instructions in the notebook named `Weather and Elevation`

# Cleanup

Locate the name of your resource group and [follow these instructions](https://docs.microsoft.com/azure/azure-resource-manager/management/delete-resource-group?tabs=azure-portal&WT.mc_id=academic-0000-jasmineg#delete-resource-group)

## Learn More

  -  **Structured**
     -  [Azure SQL documentation overview](https://docs.microsoft.com/azure/azure-sql/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Module: Migrate your relational data stored in SQL Server to Azure SQL Database
](https://docs.microsoft.com/learn/modules/migrate-sql-server-relational-data/?WT.mc_id=academic-0000-jasmineg)
     -  [Azure DB for MySQL documentation overview](https://docs.microsoft.com/azure/mysql/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Module: Migrate on-premises MySQL databases to Azure Database for MySQL
](https://docs.microsoft.com/learn/modules/migrate-on-premises-mysql-databases/?WT.mc_id=academic-0000-jasmineg)
     -  [Azure DB for Postgres documentation overview](https://docs.microsoft.com/azure/postgresql/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Module:Migrate on-premises PostgreSQL databases to Azure Database for PostgreSQL
 ](https://docs.microsoft.com/learn/modules/migrate-on-premises-postgresql-databases/?WT.mc_id=academic-0000-jasmineg)
  -  **Unstructured and Semi-structured**
     -  [Storage account (Blobs, files, queues, disks, table, Data Lake) documentation overview](https://docs.microsoft.com/azure/storage/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Modules on Storage Accounts](https://docs.microsoft.com/learn/browse/?term=storage&WT.mc_id=academic-0000-jasmineg)
     -  [Cosmos DB documentation overview](https://docs.microsoft.com/azure/cosmos-db/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Module: Work with NoSQL data in Azure Cosmos DB](https://docs.microsoft.com/learn/paths/work-with-nosql-data-in-azure-cosmos-db/?WT.mc_id=academic-0000-jasmineg)
  - **Additional services**
     -  [Azure Data Factory documentation overview](https://docs.microsoft.com/azure/data-factory/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Module: Create production workloads on Azure Databricks with Azure Data Factory
](https://docs.microsoft.com/learn/modules/create-production-workloads-azure-databricks-azure-data-factory/?WT.mc_id=academic-0000-jasmineg)
     -  [Azure Stream Analytics documentation overview](https://docs.microsoft.com/azure/stream-analytics/?WT.mc_id=academic-0000-jasmineg) 
        -  [Implement a Data Streaming Solution with Azure Streaming Analytics](https://docs.microsoft.com/learn/paths/implement-data-streaming-with-asa/?WT.mc_id=academic-0000-jasmineg)
     -  [Azure Databricks documentation overview](https://docs.microsoft.com/azure/azure-databricks/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Module: Read and write data in Azure Databricks](https://docs.microsoft.com/learn/modules/read-write-data-azure-databricks/?WT.mc_id=academic-0000-jasmineg)
     -  [Azure Notebooks documentation overview](https://docs.microsoft.com/azure/notebooks/?WT.mc_id=academic-0000-jasmineg) 
        -  [MS Learn Module: Introduction to machine learning with Python and Azure Notebooks
](https://docs.microsoft.com/learn/paths/intro-to-ml-with-python/?WT.mc_id=academic-0000-jasmineg)

- Info on [REST](https://www.codecademy.com/articles/what-is-rest)
