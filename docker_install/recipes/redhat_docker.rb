yum_package 'docker.x86_64' do
    provider Chef::Provider::Package::Yum
    action :install
end

cookbook_file '/etc/sysconfig/docker' do
source 'docker'
user 'root'
group 'root'
mode '0755'
action :create
end

service 'docker' do
action [:enable, :start]
end
