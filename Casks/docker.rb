class Docker < Cask
  url 'http://get.docker.io/builds/Darwin/x86_64/docker-0.12.0'
  homepage 'https://www.docker.io/'
  version '0.12.0'
  sha256 'a38dccb7f544fad4ef2f95243bef7e2c9afbd76de0e4547b61b27698bf9065f3'
  binary 'docker-0.12.0', :target => '/usr/local/bin/docker'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/docker-0.12.0"
  end
end
