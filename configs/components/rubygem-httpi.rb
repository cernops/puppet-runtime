component "rubygem-httpi" do |pkg, settings, platform|
  pkg.version "2.4.4"
  pkg.md5sum "6aa3fbd69cad4b3fd2fcb1f4b6a81c74"
  pkg.url "https://rubygems.org/downloads/httpi-#{pkg.get_version}.gem"

  pkg.build_requires "ruby-#{settings[:ruby_version]}"

  # When cross-compiling, we can't use the rubygems we just built.
  # Instead we use the host gem installation and override GEM_HOME. Yay?
  pkg.environment "GEM_HOME" => settings[:gem_home]

  # PA-25 in order to install gems in a cross-compiled environment we need to
  # set RUBYLIB to include puppet and hiera, so that their gemspecs can resolve
  # hiera/version and puppet/version requires. Without this the gem install
  # will fail by blowing out the stack.
  pkg.environment "RUBYLIB" => "#{settings[:ruby_vendordir]}:$$RUBYLIB"

  pkg.install do
    ["#{settings[:gem_install]} httpi-#{pkg.get_version}.gem"]
  end
end
