class Docker < Cask
  url 'http://get.docker.io/builds/Darwin/x86_64/docker-1.1.1'
  homepage 'https://www.docker.io/'
  version '1.1.1'
  sha256 'bbe72c00757bb4de96edbc7d69b329b7ea4fc87edd4a53655f7048cdde95ca04'
  binary 'docker-1.1.1', :target => '/usr/local/bin/docker'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/docker-1.1.1"
  end
end
