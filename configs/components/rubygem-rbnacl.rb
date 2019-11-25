component "rubygem-rbnacl" do |pkg, settings, platform|

  version = settings[:rubygem_ipaddress_version] || '4.0.2'
  pkg.version version
  pkg.md5sum "5e433ad400ed80c87307532bf50a978e"

  instance_eval File.read('configs/components/_base-rubygem.rb')
end
