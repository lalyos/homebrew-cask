class Docker < Cask
  url 'http://get.docker.io/builds/Darwin/x86_64/docker-0.10.0'
  homepage 'https://www.docker.io/'
  version '0.10.'
  sha256 '416835b2e83e520c3c413b4b4e4ae34bca20704f085b435f4c200010dd1ac3b7'
  binary 'docker-0.10.0', :target => '/usr/local/bin/docker' 
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/docker-0.10.0"
  end
end
