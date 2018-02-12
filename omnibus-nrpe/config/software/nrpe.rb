
name "nrpe"
default_version "3.2.1"
source url: "https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-#{version}/nrpe-#{version}.tar.gz",
       md5: "8997e195fea93cdceb8c7ed8ac1d43bc"

dependency "zlib"
dependency "openssl"

relative_path "nrpe-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  configure =  ["./configure",
                "--with-nrpe-user=nagios" ,
                " --with-nrpe-group=nagios",
                "--with-nagios-user=nagios",
                "--with-nagios-group=nagios",
                "--prefix=#{install_dir}/embedded --with-ssl=#{install_dir}/embedded "
  ]

  command configure.join(" "), env: env
  make "-j #{workers} all ", env: env
  #make "install",  :env => env
  command "sudo make install",  :env => env

end

