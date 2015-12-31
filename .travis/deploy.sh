#!/bin/bash
# Decrypt the private key
echo "Decrypt key"
openssl aes-256-cbc -K $encrypted_3fec25997f5e_key -iv $encrypted_3fec25997f5e_iv -in .travis/ssh_key.enc -out ~/.ssh/id_rsa -d
# Set the permission of the key
echo "chmod for the key"
chmod 600 ~/.ssh/id_rsa
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/id_rsa
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config
# Set Git config
git config --global user.name "Blog Bot"
git config --global user.email vmlinz+blogbot@gmail.com
# Clone the repository
echo "clone original blog site"
git clone git@github.com:vmlinz/vmlinz.github.io.git .deploy_git
# Deploy to GitHub
echo "deploy new changes to blog site"
npm run deploy
