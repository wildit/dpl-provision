Vagrant.configure("2") do |config|
  config.vm.define "dpl" do |dpl|
    dpl.vm.box = "bento/ubuntu-24.04"
    dpl.vm.hostname = 'dpl'
    dpl.vm.box_url = "bento/ubuntu-24.04"

    dpl.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--name", "dpl"]
    end
    config.vm.provision "shell", path: "dpl_machine.sh"
    config.vm.provision "shell", path: "dpl_provision.sh"
  end 
end
