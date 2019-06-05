component "rubygem-net-ssh-krb" do |pkg, settings, platform|

  version = settings[:rubygem_net_ssh_krb_version] || '0.4.0'
  pkg.version version

  pkg.md5sum  "a19209530717d3b1254aebb2ab230635"

  instance_eval File.read('configs/components/_base-rubygem.rb')
end
