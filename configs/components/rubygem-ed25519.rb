component "rubygem-ed25519" do |pkg, settings, platform|

  version = settings[:rubygem_ipaddress_version] || '1.2.4'
  pkg.version version
  pkg.md5sum "ba27e98736828152d900dd14b429fc27"

  instance_eval File.read('configs/components/_base-rubygem.rb')
end
