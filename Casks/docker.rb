class Docker < Cask
  url 'http://get.docker.io/builds/Darwin/x86_64/docker-1.0.0'
  homepage 'https://www.docker.io/'
  version '1.0.0'
  sha256 '67c3c9f285584533ac365a56515f606fc91d4dcd0bfa69c2f159eeb5e37ea3b8'
  binary 'docker-1.0.0', :target => '/usr/local/bin/docker'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/docker-1.0.0"
  end
end
