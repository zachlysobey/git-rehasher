#!/bin/bash

git commit -m "committing!"

commit_hash=$(git rev-parse HEAD)
echo "commit_hash: $commit_hash"

nonce=0
while [[ $commit_hash != 00* ]]
do
  echo "nonce: $nonce"
  git commit --amend -m "commiting! (nonce=$nonce)" >/dev/null
  commit_hash=$(git rev-parse HEAD)
  echo "commit_hash: $commit_hash"
  ((nonce++))
done
