#azure cli sistemine login olmak
az login

#SSH Permission denied (publickey). Hatası için çözüm
# https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows

#1. Önce resource group oluşturun:
az group create \
    --name "enddemo-rg" \
    --location "westeurope"

#2 Generate ssh key
az -generate-ssh-keys

#2. Sanal Makine geliyor: 
# SSH Key Azureda varsayılan key olmalı eğer yoksa generate keyle üretmeni ister
az vm create \
    --resource-group "enddemo-rg" \
    --name "endtestlin-cli" \
    --image "UbuntuLTS" \
    --admin-username "demoadmin" \
    --authentication-type "ssh" \
    --ssh-key-value ~/.ssh/id_rsa.pub \
    #--generate-ssh-keys

#3. SSH portunu açmak 22
az vm open-port \
    --resource-group "enddemo-rg" \
    --name "endtestlin-cli" \
    --port "22"

#4. Yeni sanal makinenin public IP adresini al:
az vm list-ip-addresses \
    --resource-group "enddemo-rg" \
    --name "endtestlin-cli" \
    --output table

#5. Oluşturduğumuz sunucu kapatmak
az vm stop \
    --resource-group "enddemo-rg" \
    --name "endtestlin-cli" 

#6. Sanal sunucuyu deallocate etmek
az vm deallocate \
    --resource-group "enddemo-rg" \
    --name "endtestlin-cli" 

#7 ssh bağlanalım
ssh demoadmin@20.16.7.67

#8 Resource grubu silmek
az group delete \
    --resource-group "enddemo-rg"