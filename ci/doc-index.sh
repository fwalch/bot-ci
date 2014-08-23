#!/bin/bash -e

BUILD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source ${BUILD_DIR}/ci/common/documentation.sh

generate_doc_index() {
  echo "Updating index.html from ${INDEX_PAGE_URL}."
  wget -q ${INDEX_PAGE_URL} -O ${DOC_DIR}/index.html
}

INDEX_PAGE_URL=${INDEX_PAGE_URL:-http://neovim.org/doc_index}

(
  DOC_SUBTREE="/index.html"
  clone_doc
  generate_doc_index
  commit_doc
)
