# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 80, host: 8000 

  config.vm.provider "virtualbox" do |vb|
	vb.customize ["modifyvm", :id, "--memory", "1024"]
	vb.customize ["modifyvm", :id, "--cpus"  , 2]
	vb.customize ["modifyvm", :id, "--chipset", "ich9"]

	file_to_disk = './disk1.vdi'
  	# validate this should be run it once
  	if ARGV[0] == "up" && ! File.exist?(file_to_disk)
      		vb.customize [
        	'createhd',
        	'--filename', file_to_disk,
        	'--format', 'vdi',
        	# 10gb
        	'--size', 10 * 1024
        	]

	    	vb.customize [
              	'storageattach', :id,
              	'--storagectl', 'SATAController',
	      	'--port', 1, '--device', 0,
	      	'--type', 'hdd', '--medium',
	      	file_to_disk
	      	]
	end

	if ARGV[0] == "up" && ! File.exist?(file_to_disk)
		# run script to map new disk
		config.vm.provision "shell", path: "shell/bootstrap.sh"
		# run script to increase swap memory
		config.vm.provision "shell", path: "shell/increase_swap.sh"
	end
  end

  config.vm.provision :chef_solo do |chef|
  	chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
	chef.add_recipe "shelly"
  end

  config.vm.synced_folder "apps/", "/var/www/", user: "www-data", group: "www-data"
end
