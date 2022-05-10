#!/bin/bash

declare -i i=0

declare -i end=`curl -X "GET" "https://api.spotify.com/v1/playlists/038AujGG7ZbzEZAKtdGhoN/tracks?limit=1" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQDMJh8TdZ0aqxhK4_hHXDGoeF23tAMsecYtFHxAKAHy-aJ4UZ7d8ZeNETxlukh4BoeioBgTCWaoca-yzVB5A8t6zkGAVRRaLcR5xHyKpjMIMZplyjP5eLLiPXFv1k3gTK2WXkTuACoA-gM2FQ"| jq -r '.total'`


while [ $i -lt $end ]
do
curl -X "GET" "https://api.spotify.com/v1/playlists/038AujGG7ZbzEZAKtdGhoN/tracks?offset=$i&fields=items(track(name))%2Citems(track(album(artists(name))))" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQDMJh8TdZ0aqxhK4_hHXDGoeF23tAMsecYtFHxAKAHy-aJ4UZ7d8ZeNETxlukh4BoeioBgTCWaoca-yzVB5A8t6zkGAVRRaLcR5xHyKpjMIMZplyjP5eLLiPXFv1k3gTK2WXkTuACoA-gM2FQ" |jq >>spoticheck.out 
	i+=100
done
