#!/bin/bash

LOGFILE=/var/log/cdrip.log
LOGRIPFILE=/var/log/cdrip_last.log
LOGDEBUGFILE=/var/log/cdrip_debug.log

echo "$(date) CD rip triggerred" >> "${LOGFILE}"

(
  flock -n 200 || exit 1  # prevent multiple invocations on the same CD

  sleep 120  # give enough time for the CD to get recognized

  TMPDIR="/tmp/music"
  OUTPUTDIR="/mnt/music"

  rm -rf $TMPDIR
  sudo -u pi mkdir $TMPDIR

  pushd $TMPDIR
  sudo -u pi abcde -p -N -d /dev/sr0 -o flac -D > $LOGRIPFILE 2> $LOGDEBUGFILE
  popd

  cp -rf "${TMPDIR}/"* "${OUTPUTDIR}/"

  EXTRACTED=`ls ${TMPDIR}`
  echo "${date} Copied ${EXTRACTED} to ${OUTPUTDIR}" >> $LOGFILE
  eject
) 200>/var/lock/.cdrip.lock
