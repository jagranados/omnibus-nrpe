
name "nrpe"
default_version "3.2.1"
source url: "https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-#{version}/nrpe-#{version}.tar.gz"
       md5: "8997e195fea93cdceb8c7ed8ac1d43bc"

dependency "zlib"
dependency "openssl"

relative_path "nrpe-#{version}"

build do
  command "./configure"
  command "make"
  command "make install"
end
