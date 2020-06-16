## Store hand variables
storageacct=$(az deployment group list --resource-group princeton-test-deploy --query '[1].properties.outputs.databaseName.value' -o tsv)
expireDate=$(date -u -d '+1 hour' '+%Y-%m-%dT%H:%MZ')

## Create account level SAS Token for storage account that expires in 1 hour
sas=$(az storage account generate-sas \
    --account-name $storageacct \
    --expiry $expireDate \
     --resource-types sco \
    --permissions acdlrw \
    --services b 
    )
    

## Append token to storage account URL and upload JSON data
azcopy copy 'https://pandemicdatalake.blob.core.windows.net/public/curated/covid-19/bing_covid-19_data/latest/bing_covid-19_data.json' 'https://$storagecct.blob.core.windows.net/semi-structured-data/bing_covid-19_data.json'


## Append token to storage account URL and upload sql bacpac file
azcopy copy 'https://github.com/paladique/Workshop-DataInAzure/blob/master/template/db-demo.bac' 'https://$storagecct.blob.core.windows.net/semi-structured-data/db-demo.bacpac'

## Create the Database in Azure SQL Database by importing the bacpac file

az sql db import -s myserver -n mydatabase -g mygroup -p password -u login \
    --storage-key $sas \
    --storage-key-type SharedAccessKey \
    --storage-uri 'https://$storageacct.blob.core.windows.net/semi-structured-data/db-demo.bacpac'