# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'precise32'
  config.vm.box_url  = 'http://files.vagrantup.com/precise32.box'
  config.vm.hostname = 'rails-dev-box'


  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.synced_folder "my-app", "/home/vagrant/my-app"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'rails-dev-box/puppet/manifests'
    puppet.module_path    = 'rails-dev-box/puppet/modules'
  end
end
