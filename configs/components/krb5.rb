component "krb5" do |pkg, settings, platform|

  pkg.version "1.17.1"
  pkg.md5sum "417d654c72526ac51466e7fe84608878"
  pkg.url "http://web.mit.edu/kerberos/dist/krb5/#{pkg.get_version.sub(%r{\.\d+$},'')}/krb5-#{pkg.get_version}.tar.gz"
  pkg.build_requires 'byacc'

  if platform.is_cross_compiled_linux?
    host_opt = "--host #{settings[:platform_triple]}"

    pkg.environment "PATH" => "/opt/pl-build-tools/bin:$$PATH:#{settings[:bindir]}"
    pkg.environment "CFLAGS" => settings[:cflags]
    pkg.environment "LDFLAGS" => settings[:ldflags]
  end

  pkg.configure do
    ["pushd src",
     "autoreconf",
     "./configure --prefix=#{settings[:prefix]} --sbindir=#{settings[:prefix]}/bin #{host_opt}",
     "popd"
    ]
  end

  pkg.build do
    ["pushd src",
     "#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1)",
     "popd",
    ]
  end

  pkg.install do
    [
      "pushd src",
      "#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1) install",
      "popd",
    ]
  end
end
