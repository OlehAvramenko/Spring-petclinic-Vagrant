Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.define "DB_VM" do |subconfig|
    subconfig.vm.hostname = "DB"
    subconfig.vm.network "private_network",  ip: "172.17.177.21"
    subconfig.ssh.username = "vagrant"    
    subconfig.vm.provision "shell", path: "provision_DB.sh"
    subconfig.vm.provision "shell", inline: <<-SHELL
     echo "export DB_USER=petclinic" >> /etc/profile.d/myvar.sh
     echo "export DB_PASS=petclinic" >> /etc/profile.d/myvar.sh
     echo "export DB_NAME=petclinic" >> /etc/profile.d/myvar.sh
SHELL
    end

 

  config.vm.define "APP_VM" do |subconfig|
    subconfig.vm.hostname = "APP"
    subconfig.vm.network "private_network", ip: "172.17.177.22"
    subconfig.vm.network  "forwarded_port", guest: 8080, host: 9999
     subconfig.vm.provision "shell", inline: <<-SHELL
     echo "export DB_HOST=172.17.177.21" >> /etc/profile.d/myvar.sh
     echo "export DB_PORT=3306" >> /etc/profile.d/myvar.sh
     echo "export DB_NAME=petclinic" >> /etc/profile.d/myvar.sh
     echo "export DB_USER=petclinic" >> /etc/profile.d/myvar.sh
     echo "export DB_PASS=petclinic" >> /etc/profile.d/myvar.sh
     echo "export APP_USER=app_user" >> /etc/profile.d/myvar.sh
     echo "export APP_DIR=/home/app_user/" >> /etc/profile.d/myvar.sh
SHELL
    subconfig.vm.provision "shell", path: "provision_APP.sh"
    subconfig.vm.provision "shell", run: "always", path: "everyboot.sh"    
end
end
