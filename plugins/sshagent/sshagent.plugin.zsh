# Load up identities and ssh agent.
eval "$(ssh-agent)" &> /dev/null

# Add identities - skip files ending with .pub
for id in $(find $HOME/.ssh -type f \
    -iname '*.pem' -or \
    -iname 'id_*' \
    -not -iname '*.pub'); do
  ssh-add $id &> /dev/null
done