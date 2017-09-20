# Xan's sample Vagrantfile
Vagrant.configure("2") do |config|
    config.vm.define "wordpress", primary: true do |wordpress|
        wordpress.vm.box = "ubuntu/xenial64"
        wordpress.vm.hostname = "wordpress"
        wordpress.vm.network "private_network", ip: "192.168.20.111"
        wordpress.vm.network "forwarded_port", guest: 22, host: 22022
        wordpress.vm.network "forwarded_port", guest: 80, host: 22088

        wordpress.vm.provider "virtualbox" do |vb|
            vb.name = "wordpress"
            vb.memory = 512
            # Added the following line to prevent error running under Windows 10 WSL
            vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
        end

        wordpress.vm.provision "shell", path: "env/local/userdata.sh"

        wordpress.vm.provision "ansible" do |a|
            a.limit = "all"
            a.config_file = "ansible.cfg"
            a.inventory_path = "env/local/inventory.yml"
            a.playbook = "playbooks/wordpress-lemp.yml"
        end
    end
end
