#!/usr/bin/env bash
# Build the static bundle and publish it to the gh-pages branch.
# GitHub Pages for this repo is configured with "Deploy from a branch: gh-pages".
set -euo pipefail
cd "$(dirname "$0")/.."

npm run temple:build

remote="$(git remote get-url origin)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
git -C "$tmp" init -q -b gh-pages
cp -R target/temple-run/dist/. "$tmp/"
touch "$tmp/.nojekyll"
git -C "$tmp" add -A
git -C "$tmp" -c user.name='temple-run deploy' -c user.email='deploy@localhost' \
  commit -q -m "deploy: temple-run static build $(date -u +%Y-%m-%dT%H:%M:%SZ)"
git -C "$tmp" remote add origin "$remote"
git -C "$tmp" push -f origin gh-pages

repo_path="$(printf '%s' "$remote" | sed -E 's#.*github\.com[:/]([0-9]+/)?##; s#\.git$##')"
owner="${repo_path%%/*}"
repo="${repo_path##*/}"
echo "deployed: https://${owner}.github.io/${repo}/"
