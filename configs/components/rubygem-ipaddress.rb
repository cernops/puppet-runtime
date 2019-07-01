component "rubygem-ipaddress" do |pkg, settings, platform|

  version = settings[:rubygem_ipaddress_version] || '0.8.3'
  pkg.version version
  pkg.md5sum "15c3ce3bcf68ecaee8d25070b033bcac"

  instance_eval File.read('configs/components/_base-rubygem.rb')
end
