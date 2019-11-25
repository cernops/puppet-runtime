component "rubygem-rbnacl-libsodium" do |pkg, settings, platform|

  version = settings[:rubygem_rbnacl_libsodium_version] || '1.0.16'
  pkg.version version
  pkg.md5sum "79e50b5fb359d5c91c501f9e47eb4e35"

  instance_eval File.read('configs/components/_base-rubygem.rb')
end
