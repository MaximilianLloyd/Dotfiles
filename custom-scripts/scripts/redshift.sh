#!/bin/bash
# This script fetches lat and long information from Mozilla's geolocation service. It then passes
# lat and long to redshift-gtk. If geolocation service is not available (e.g. no internet
# connection, service down) it sleeps and retries.

# URL taken from geoclue2. It returns JSON document with LAT and LONG.
URL="https://location.services.mozilla.com/v1/geolocate?key=16674381-f021-49de-8622-3021c5942aff"
# LAT and LONG numbers in the following format: "LAT:LON"
COORDS=""

function get_geolocation() {
  exit_status=1
  retry_times=30
  sleep_time=15

  while [ $exit_status -ne 0 ] && [ $retry_times -gt 0 ]; do
    sleep $sleep_time
    echo "Trying to fetch geolocation coordinates from $URL"
    json_coords=$(curl -s $URL)
    exit_status=$?
    retry_times=$((retry_times - 1))
  done

  echo "Received: $json_coords"
  COORDS=$(jq -c -r '[.location.lat, .location.lng] | @csv' <<< $json_coords | sed 's/,/:/')
}

get_geolocation

if [ -z "$COORDS" ]; then
  echo "Unknown Error: LAT and LONG not set. Is JSON response malformed or has a different schema?"
  exit 1
fi

redshift-gtk -l $COORDS
