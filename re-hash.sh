#!/bin/bash

commit_hash=$(git rev-parse HEAD)
echo "commit hash: $commit_hash"

nonce=0
while [[ $commit_hash != 00* ]]
do
  git commit --amend -m "commiting! (nonce=$nonce)" >/dev/null
  commit_hash=$(git rev-parse HEAD)
  echo "$commit_hash (nonce: $nonce)"
  ((nonce++))
done
