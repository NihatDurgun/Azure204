#azure cli sistemine login olmak
az login

#azure cli help komutları
az help

#eğer birden fazla aboneliğiniz varsa, hangisyle 
az account set  --subscription "[id]"
# az cli çalışıyor mu ve doğru subscription'da mıyım
az group list --output table

#VM image listi çekmek
az vm image list --output table 

#1. Önce resource group oluşturun:
az group create \
    --name "enddemo-rg" \
    --location "westeurope"

#2. Sanal Makine geliyor:
az vm create \
    --resource-group "enddemo-rg" \
    --name "endtestwin-cli" \
    --image "win2019datacenter" \
    --admin-username "demoadmin" \
    --admin-password "Pa55W0rd1234" 

#3. RDP portunu açmak 3389
az vm open-port \
    --resource-group "enddemo-rg" \
    --name "endtestwin-cli" \
    --port "3389"

#4. Yeni sanal makinenin public IP adresini al:
az vm list-ip-addresses \
    --resource-group "enddemo-rg" \
    --name "endtestwin-cli" \
    --output table

#5. Oluşturduğumuz sunucu kapatmak
az vm stop \
    --resource-group "enddemo-rg" \
    --name "endtestwin-cli" 

#6. Sanal sunucuyu deallocate etmek
az vm deallocate \
    --resource-group "enddemo-rg" \
    --name "endtestwin-cli" 

#7 rdp üzerinden sunucumuza bağlanalım

#8 Resource grubu silmek
#yes silinsin mi sorusunun cevabı, --no-wait işlemi arka planda çalıştır
az group delete \
    --resource-group "enddemo-rg" --yes --no-wait