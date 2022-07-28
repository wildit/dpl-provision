Vagrant.configure("2") do |config|
  config.vm.define "dpl" do |dpl|
    dpl.vm.box = "peru/ubuntu-20.04-desktop-amd64"
    dpl.vm.hostname = 'dpl'
    dpl.vm.box_url = "peru/ubuntu-20.04-desktop-amd64"

    dpl.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--name", "dpl"]
    end
    config.vm.provision "shell", path: "dpl_provision.sh"
  end 
end



#Vagrant.configure("2") do |config|

#  config.vm.box = "peru/ubuntu-20.04-desktop-amd64"

 
#  config.vm.provision "shell", path: "dpl_provision.sh"
  
  
 
# end
