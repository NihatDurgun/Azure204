#Az hesabı belirli bir abonelik hesabıyla bağlanmak
Connect-AzAccount -SubscriptionName 'Test Account'


#Doğru subscriptionda olmamız gerekmektedir.
Set-AzContext -SubscriptionName 'Test Account'


#Resource Group oluşturmak
New-AzResourceGroup -Name "enddemo-rg" -Location "westeurope"


#VM hesabı üretmek için Credential üretmek
$username = 'demoadmin'
$password = ConvertTo-SecureString 'password123$%^&*' -AsPlainText -Force
$WindowsCred = New-Object System.Management.Automation.PSCredential ($username, $password)


#Windows sanal makinesi üretmek istenmektedir.
New-AzVM `
    -ResourceGroupName 'enddemo-rg' `
    -Name 'endtestwin-cli' `
    -Image 'Win2019Datacenter' `
    -Credential $WindowsCred `
    -OpenPorts 3389 `
    -sku Standart


#Genel IP adresinin alınması
Get-AzPublicIpAddress `
    -ResourceGroupName 'enddemo-rg' `
    -Name 'endtestwin-cli' | Select-Object IpAddress

#Resource groubunu silinmesi
Remove-AzResourceGroup -Name 'enddemo-rg'