
environment = "stg"
vnetname = "myvnet"
vnetaddress = ["10.3.0.0/16"]
webSubnetname = "myweb"
websubnetaddress = ["10.3.1.0/24"]
webnsg = "web-nsg1"
hostname = "web-vm"  
size = "Standard_B2s"
user = "adminuser"
password = "root@123" 
sourceimage = {
    publisher = "Redhat"
    offer     = "RHEL"
    sku       = "7.5"
    version   = "latest"
    }
pubipname = "web-pub" 
vnicname = "web-lin-nic" 
privateip = "10.3.1.8" 
server_instance = 1
