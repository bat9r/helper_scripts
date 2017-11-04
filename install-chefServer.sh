Password=$1
cd /tmp
rpm -Uvh https://packages.chef.io/files/stable/chef-server/12.17.5/el/7/chef-server-core-12.17.5-1.el7.x86_64.rpm
chef-server-ctl reconfigure
chef-server-ctl user-create bat9r bat9r bat9r bat9r.dzuno@gmail.com '$Password' --filename /root/bat9r.pem
chef-server-ctl org-create bat9rco 'bat9rco' --association_user bat9r --filename /bat9rco-validator.pem
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure
chef-server-ctl install opscode-push-jobs-server
chef-server-ctl reconfigure
opscode-push-jobs-server-ctl reconfigure
