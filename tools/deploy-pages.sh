#!/usr/bin/env bash
# Build the static bundle and publish it to the gh-pages branch.
# GitHub Pages for this repo is configured with "Deploy from a branch: gh-pages".
set -euo pipefail
cd "$(dirname "$0")/.."

npm run temple:build

remote="$(git remote get-url origin)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
source_commit="$(git rev-parse HEAD)"
git -C "$tmp" init -q
git -C "$tmp" remote add origin "$remote"
if git -C "$tmp" fetch --depth=1 origin gh-pages; then
  git -C "$tmp" checkout -q -b gh-pages FETCH_HEAD
else
  git -C "$tmp" checkout -q --orphan gh-pages
fi
find "$tmp" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
cp -R target/temple-run/dist/. "$tmp/"
touch "$tmp/.nojekyll"
printf '{"sourceCommit":"%s","builtAt":"%s"}\n' "$source_commit" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$tmp/deployment.json"
git -C "$tmp" add -A
git -C "$tmp" -c user.name='temple-run deploy' -c user.email='deploy@localhost' \
  commit -q -m "deploy: temple-run static build $(date -u +%Y-%m-%dT%H:%M:%SZ)"
git -C "$tmp" push origin gh-pages

echo "published source $source_commit to origin/gh-pages"
echo "deployment URL: https://malcolmyu.github.io/temple-run/ (verify deployment.json after Pages finishes)"
