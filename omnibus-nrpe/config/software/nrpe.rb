
name "nrpe"
default_version "3.2.1"
source url: "https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-#{version}/nrpe-#{version}.tar.gz",
       md5: "8997e195fea93cdceb8c7ed8ac1d43bc"

dependency "zlib"
dependency "openssl"

relative_path "nrpe-#{version}"

build do
env = {
    "LDFLAGS" => " -pie -L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
    "CFLAGS" => " -fPIC -L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
    "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
  }

  command "./configure --prefix=#{install_dir}/embedded --with-ssl=#{install_dir}/embedded ", :env => env
  command "make" , :env => env
  command "make install",  :env => env

end
