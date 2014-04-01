cd /usr/local/Library/Taps/phinze-cask
unzip -qod /tmp/ ~/Downloads/atom-mac.zip

VERSION=$(cat /tmp/Atom.app/Contents/Resources/app/package.json|jq .version -r)
SHA=$(shasum -a 256 ~/Downloads/atom-mac.zip|sed "s/[^0-9a-z].*//")

sed -i "/version/ s/[0-9\.]\{5,\}/$VERSION/"  Casks/atom.rb
sed -i "/sha256/ s/[a-z0-9]\{64\}/$SHA/" Casks/atom.rb

git commit -m "atom $VERSION" Casks/atom.rb

git fetch origin
git rebase origin/master
git push lalyos master --force

rm ~/Downloads/atom-mac*.zip
rm -rf /tmp/Atom.app
cd -
brew cask install atom
