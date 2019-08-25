#!/bin/bash

git commit -m "committing!"

commit_hash=$(git log "--pretty=format:%H")
echo commit_hash=$commit_hash

nonce=0
while [[ $commit_hash != 0* ]]
do
  echo "no leading zero"
  echo "nonce: $nonce"
  git commit --amend -m "commiting! (nonce=$nonce)"
  ((nonce++))
done
