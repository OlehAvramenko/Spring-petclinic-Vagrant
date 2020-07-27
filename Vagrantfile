Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provider "virtualbox" do |v|
        v.memory = 3072
end

# ======= Configure DB VM =======

  config.vm.define "DB_VM" do |subconfig|
    subconfig.vm.hostname = "DB"
    subconfig.vm.network "private_network",  ip: "172.17.177.21"
    subconfig.ssh.username = "vagrant"
#   Set ENV
    subconfig.vm.provision "shell", path: "env_DB.sh"   
#   Install mysql and etc.
    subconfig.vm.provision "shell", path: "provision_DB.sh"
    end

#  ======= Configure APP VM =======

  config.vm.define "APP_VM" do |subconfig|
    subconfig.vm.hostname = "APP"
    subconfig.vm.network "private_network", ip: "172.17.177.22"
    subconfig.vm.network  "forwarded_port", guest: 8080, host: 9999
#   Set ENV
    subconfig.vm.provision "shell", path: "env_APP.sh"
#   Build application
    subconfig.vm.provision "shell", path: "provision_APP.sh"
#   Start application
    subconfig.vm.provision "shell", run: "always", path: "evryboot.sh"    
	
end
end
