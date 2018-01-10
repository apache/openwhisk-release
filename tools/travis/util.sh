#!/usr/bin/env bash

function read_file() {
    cat $1
}

function json_by_key() {
    input=$1
    key=$2
    echo $input | jq ''.$key'' | sed -e 's/^"//' -e 's/"$//'
}
