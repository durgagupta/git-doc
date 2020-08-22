#!/bin/bash
# crawl a sitemap.xml using parallel processes

set -euo pipefail

if [ $# -eq 0 ]; then
  echo "Use $0 <sitemap url> [parallel processes]"
  exit 1
fi

SITEMAP_URL=$1
PARALLEL_PROCESSES=${2:-8}


DATE=`date +%Y-%m-%d`
TEMPDIR="tmpdir/"$DATE
trap 'rm -rf ${TEMPDIR}' EXIT
mkdir -p $TEMPDIR
echo wget -q "$SITEMAP_URL" -O "$TEMPDIR"/sitemap.xml



echo " "
echo "Crawling ${SITEMAP_URL}"
echo "using ${PARALLEL_PROCESSES} thread(s)"
echo " "

xmlstarlet sel -t -v '//*[local-name()="loc"]' "$TEMPDIR"/sitemap.xml | parallel --bar -P "$PARALLEL_PROCESSES" curl -o /dev/null -s

echo " "
echo "Crawl complete"
echo " "
