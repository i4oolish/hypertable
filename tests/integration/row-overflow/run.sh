#!/bin/sh

HT_HOME=${INSTALL_DIR:-"$HOME/hypertable/current"}
SCRIPT_DIR=`dirname $0`
DATA_SIZE=${DATA_SIZE:-"20000000"}

$HT_HOME/bin/clean-database.sh
$HT_HOME/bin/start-all-servers.sh --no-thriftbroker local \
    --Hypertable.RangeServer.Range.SplitSize=2000000

$HT_HOME/bin/hypertable --no-prompt < $SCRIPT_DIR/create-table.hql

echo "======================="
echo "Row overflow WRITE test"
echo "======================="
$HT_HOME/bin/ht_write_test \
    --Hypertable.Mutator.ScatterBuffer.FlushLimit.PerServer=50K \
    --Hypertable.Mutator.FlushDelay=5 --max-keys=1 \
    $DATA_SIZE 2>&1 | grep -c '^Failed.*row overflow'
