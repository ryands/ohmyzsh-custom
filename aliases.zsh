# meta
editzsh() {
  $EDITOR $HOME/.oh-my-zsh
}

# git
alias gpr='git pull -r'
alias grom='git rebase origin/master'
alias glog='git log'
alias wat='git status'

# bundle/ruby/rails
alias be='bundle exec'
alias brake='be rake'
alias brspec='be rspec'
alias bcap='be cap'
alias bi='bundle install'

alias rc='rails console'
alias rs='rails server'
alias rdb='rails dbconsole'
alias rdbm='brake db:migrate'

# rorup = Ruby On Rails Update
rorup() {
  git pull -r && bundle install && bundle exec rake db:migrate
}

# node stuff
alias npmi='npm install'
alias boi='bower install'

