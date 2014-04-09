#!/bin/bash

ZIP=~/Downloads/atom-mac.zip
if [ ! -f $ZIP ]; then
  echo missing $ZIP
  exit 1
fi

cd /usr/local/Library/Taps/phinze-cask
rm -rf /tmp/Atom.app
echo unzip $ZIP into /tmp ...
unzip -qod /tmp/ $ZIP

VERSION=$(cat /tmp/Atom.app/Contents/Resources/app/package.json|jq .version -r)
SHA=$(shasum -a 256 ~/Downloads/atom-mac.zip|sed "s/[^0-9a-z].*//")
echo $ZIP VERSION=$VERSION

ACTUAL_VERSION=$(sed -n  "/version/ s/.*[^0-9]\([0-9\.]\{5,\}\).*/\1/p"  Casks/atom.rb)


if [ "$VERSION" == "$ACTUAL_VERSION" ]; then
  echo formula is uptodate: $VERSION
  exit 1
fi

aws s3 cp ~/Downloads/atom-mac.zip s3://sequenceiq/

sed -i "/version/ s/[0-9\.]\{5,\}/$VERSION/"  Casks/atom.rb
sed -i "/sha256/ s/[a-z0-9]\{64\}/$SHA/" Casks/atom.rb

git commit -m "atom $VERSION" Casks/atom.rb

git fetch origin
git rebase origin/master
git push lalyos atom --force

#rm ~/Downloads/atom-mac*.zip
cd -
brew cask install atom
