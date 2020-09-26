#!/bin/bash

gcloud logging write example-log "{\"Action\":\"GET\",\"ClientIP\":\"35.227.108.237\",\"responsePayload\":{\"products\":[{\"categories\":\"vintage\",\"description\":\"This typewriter looks good in your living room.\",\"id\":\"OLJCESPC7Z\",\"name\":\"Vintage Typewriter\",\"picture\":\"/static/img/products/typewriter.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"nanos\":990000000,\"units\":67}},{\"categories\":[\"photography\",\"vintage\"],\"description\":\"You won't have a camera to use it and it probably doesn't work anyway.\",\"id\":\"66VCHSJNUP\",\"name\":\"Vintage Camera Lens\",\"picture\":\"/static/img/products/camera-lens.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"nanos\":490000000,\"units\":12}},{\"categories\":\"cookware\",\"description\":\"Always wanted to brew coffee with Chemex and Aeropress at home?\",\"id\":\"1YMWWN1N4O\",\"name\":\"Home Barista Kit\",\"picture\":\"/static/img/products/barista-kit.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"units\":124}},{\"categories\":\"gardening\",\"description\":\"This terrarium will looks great in your white painted living room.\",\"id\":\"L9ECAV7KIM\",\"name\":\"Terrarium\",\"picture\":\"/static/img/products/terrarium.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"nanos\":450000000,\"units\":36}},{\"categories\":[\"photography\",\"vintage\"],\"description\":\"This camera looks like it's a film camera, but it's actually digital.\",\"id\":\"2ZYFJ3GM2N\",\"name\":\"Film Camera\",\"picture\":\"/static/img/products/film-camera.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"units\":2245}},{\"categories\":[\"music\",\"vintage\"],\"description\":\"It still works.\",\"id\":\"0PUK6V6EV0\",\"name\":\"Vintage Record Player\",\"picture\":\"/static/img/products/record-player.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"nanos\":500000000,\"units\":65}},{\"categories\":\"cookware\",\"description\":\"You probably don't go camping that often but this is better than plastic cups.\",\"id\":\"LS4PSXUNUM\",\"name\":\"Metal Camping Mug\",\"picture\":\"/static/img/products/camp-mug.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"nanos\":330000000,\"units\":24}},{\"categories\":\"cycling\",\"description\":\"This single gear bike probably cannot climb the hills of San Francisco.\",\"id\":\"9SIQT8TOJO\",\"name\":\"City Bike\",\"picture\":\"/static/img/products/city-bike.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"nanos\":500000000,\"units\":789}},{\"categories\":\"gardening\",\"description\":\"Have you ever wondered whether air plants need water? Buy one and figure out.\",\"id\":\"6E92ZMYYFZ\",\"name\":\"Air Plant\",\"picture\":\"/static/img/products/air-plant.jpg\",\"priceUsd\":{\"currencyCode\":\"USD\",\"nanos\":300000000,\"units\":12}}],\"recommendations\":{\"productIds\":[\"LS4PSXUNUM\",\"L9ECAV7KIM\",\"6E92ZMYYFZ\",\"OLJCESPC7Z\",\"66VCHSJNUP\"]}}}" --payload-type=json

gcloud app create --region=us-central

gcloud alpha firestore databases create --region=us-central


export PROJECT_ID=$(gcloud info --format='value(config.project)')

gcloud iam service-accounts create apigee-firestore \
  --display-name "Service account for Apigee Firestore integration"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:apigee-firestore@$PROJECT_ID.iam.gserviceaccount.com --role roles/datastore.user

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:apigee-firestore@$PROJECT_ID.iam.gserviceaccount.com --role roles/logging.logWriter

gcloud iam service-accounts keys create key.json \
    --iam-account=apigee-firestore@$PROJECT_ID.iam.gserviceaccount.com

sed -i '' "s/PROJECT_ID/$PROJECT_ID/g" data.py

python3 data.py

sed -i '' "s/$PROJECT_ID/PROJECT_ID/g" data.py


