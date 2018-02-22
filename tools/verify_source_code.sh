#!/usr/bin/env bash

set -e

echo "Generate the report regarding the source code headers."

WORK_DIR=${1:-"$HOME"}

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1
PARENTDIR="$(dirname "$SCRIPTDIR")"

REPORT_DIR=$PARENTDIR/report
REPORT_FILE=$REPORT_DIR/apache-rat-report.txt

mkdir -p $REPORT_DIR
touch $REPORT_FILE

java -jar $SCRIPTDIR/lib/apache-rat-0.13-SNAPSHOT.jar -a $OPENWHISK_CLEANED_SOURCE_DIR > $REPORT_FILE
