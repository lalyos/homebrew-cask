class Docker < Cask
  url 'http://get.docker.io/builds/Darwin/x86_64/docker-0.11.1'
  homepage 'https://www.docker.io/'
  version '0.11.1'
  sha256 '386ffa26e52856107efb0b3075625d5b2331fa5acc8965fef87c1ab7d900c4e9'
  binary 'docker-0.11.1', :target => '/usr/local/bin/docker'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/docker-0.11.1"
  end
end
