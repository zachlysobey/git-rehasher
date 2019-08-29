#!/bin/bash

target_pattern=00*

git commit -m "committing!"

commit_hash=$(git rev-parse HEAD)
echo "commit_hash: $commit_hash"

nonce=0
while [[ $commit_hash != target_pattern ]]
do
  git commit --amend -m "commiting! (nonce=$nonce)" >/dev/null
  commit_hash=$(git rev-parse HEAD)
  echo "$commit_hash (nonce: $nonce)"
  ((nonce++))
done
