az login
az account set --subscription "Demonstration Account"

az container create \
    --resource-group enddemo-rg-docker\
    --name enddemo-hello-world-cli \
    --image \
    --ports 80

az container show --resource-group 'enddemo-rg-docker' --name "enddemo-hello-world-cli"

$URL = $(az container show --resource-group 'enddemo-rg-docker' --name 'enddemo-hello-world-cli' --query ipAddress.fqdn)
$URl = $URL -replace '"',''
echo "http://$URL"

$ACR_NAME = 'enddemoacr'

$ACR_REGISTRY_ID = $(az acr show --name $ACR_NAME --query id --output tsv)
$ACR_LOGINSERVER = $(az acr show --name $ACR_NAME --query loginserver --output tsv)

echo "ACR ID: $ACR_REGISTRY_ID"

echo "ACR LOGIN Server: $ACR_LOGINSERVER"
