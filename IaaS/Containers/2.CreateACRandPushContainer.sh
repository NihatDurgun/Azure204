az login
az account set --subscription "Demonstration Account"



az group create \
    --name bademo-rg-docker \
    --location westeurope



$ACR_NAME='tudemoacr'  #<---- Eşsiz bir isim olduğuna emin olun!
az acr create \
    --resource-group bademo-rg-docker \
    --name $ACR_NAME \
    --sku Standard 


az acr login --name $ACR_NAME 


$ACR_LOGINSERVER=$(az acr show --name $ACR_NAME --query loginServer --output tsv)
echo $ACR_LOGINSERVER



docker tag webappimage:v1 $ACR_LOGINSERVER/webappimage:v1
docker image ls $ACR_LOGINSERVER/webappimage:v1
docker image ls



docker push $ACR_LOGINSERVER/webappimage:v1


az acr repository list --name $ACR_NAME --output table
az acr repository show-tags --name $ACR_NAME --repository webappimage --output table




az acr build --image "webappimage:v1-acr-task" --registry $ACR_NAME .


az acr repository show-tags --name $ACR_NAME --repository webappimage --output table