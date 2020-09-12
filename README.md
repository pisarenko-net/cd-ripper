# cd-ripper -- Headless CD ripper

Collection of scripts and configurations for a headless CD rip system based on raspberry pi or any other Linux system.

Typical usage:
 1. trigger on new inserted disc
 2. rip CD using abcde, converting to FLAC
 3. move the result to NAS
 4. eject CD

The goal is to have as little interaction as possible and keep feeding CDs as soon as the tray opens.

## Required packages

 * abcde
 * eject
 * samba samba-common-bin smbclient cifs-utils

## Goals

This will become part of the custom CD deck build. Following features are hence necessary:
 * alert and fail if the SMB isn't mounted
 * indicate when a CD rip is in progress
 * indicate how long a rip is taking
 * set maximum rip duration and abort if exceeding
 * indicate total tracks and the current track number
 * ability to interrupt an ongoing rip
