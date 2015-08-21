update-rbenv() {
  initial=`pwd`
  cd ~/.rbenv/
  
  echo -n "rbenv: "

  git pull
  cd plugins
  for p in *; do
    cd $p
    echo -n "$p: "
    git pull
    cd ..
  done
  cd $initial
}
install-rbenv() {
  rbenv_git="https://github.com/sstephenson/rbenv"
  rbenv_plugins=(
    https://github.com/sstephenson/ruby-build
    https://github.com/sstephenson/rbenv-gem-rehash
    https://github.com/sstephenson/rbenv-default-gems 
  )

  [[ -d $HOME/.rbenv ]] && echo "rbenv already installed, update with update-rbenv" && return 1
  git clone $rbenv_git $HOME/.rbenv
  mkdir -p $HOME/.rbenv/plugins/
  cd $HOME/.rbenv/plugins/
  for plugin in $rbenv_plugins; do
    git clone $plugin
  done
  cd -

  cat <<-HEREDOC > $HOME/.rbenv/default-gems
bundler
rake
HEREDOC

}
