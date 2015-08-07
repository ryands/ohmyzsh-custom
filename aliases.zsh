alias gpr='git pull -r'
alias grom='git rebase origin/master'
alias glog='git log'
alias wat='git status'

alias be='bundle exec'
alias brake='be rake'
alias brspec='be rspec'
alias bcap='be cap'

# rorup = Ruby On Rails Update
rorup() {
  git pull -r && bundle install && bundle exec rake db:migrate
}