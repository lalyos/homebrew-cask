class Docker < Cask
  url 'http://get.docker.io/builds/Darwin/x86_64/docker-1.1.0'
  homepage 'https://www.docker.io/'
  version '1.1.0'
  sha256 '4905fa4d141fbffab7721be4f8a3e8fd788e6f377b92d29d91e85c8de97d7887'
  binary 'docker-1.1.0', :target => '/usr/local/bin/docker'
  container_type 'naked'
  after_install do
    system "chmod", "755", "#{destination_path}/docker-1.1.0"
  end
end
