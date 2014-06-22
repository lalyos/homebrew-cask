class Docker < Cask
  url 'http://get.docker.io/builds/Darwin/x86_64/docker-1.0.1'
  homepage 'https://www.docker.io/'
  version '1.0.1'
  sha256 'b662e7718f0a8e23d2e819470a368f257e2bc46f76417712360de7def775e9d4'
  binary 'docker-1.0.1', :target => '/usr/local/bin/docker'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/docker-1.0.1"
  end
end
