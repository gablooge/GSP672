 var response = context.getVariable("response.content");
var responseJson = JSON.parse(response);
var recommendations = context.getVariable("recommendations-output");
var recommendationsJson = '{"products":[{"id":"OLJCESPC7Z","name":"Vintage Typewriter","description":"This typewriter looks good in your living room.","picture":"/img/products/typewriter.jpg","priceUsd":67.98,"categories":["vintage"]},{"id":"66VCHSJNUP","name":"Vintage Camera Lens","description":"You won\'t have a camera to use it and it probably doesn\'t work anyway.","picture":"/img/products/camera-lens.jpg","priceUsd":12.48,"categories":["photography","vintage"]},{"id":"1YMWWN1N4O","name":"Home Barista Kit","description":"Always wanted to brew coffee with Chemex and Aeropress at home?","picture":"/img/products/barista-kit.jpg","priceUsd":123.99,"categories":["cookware"]},{"id":"L9ECAV7KIM","name":"Terrarium","description":"This terrarium will looks great in your white painted living room.","picture":"/img/products/terrarium.jpg","priceUsd":34.44,"categories":["gardening"]},{"id":"2ZYFJ3GM2N","name":"Film Camera","description":"This camera looks like it\'s a film camera, but it\'s actually digital.","picture":"/img/products/film-camera.jpg","priceUsd":2244.99,"categories":["photography","vintage"]},{"id":"0PUK6V6EV0","name":"Vintage Record Player","description":"It still works.","picture":"/img/products/record-player.jpg","priceUsd":65.5,"categories":["music","vintage"]},{"id":"LS4PSXUNUM","name":"Metal Camping Mug","description":"You probably don\'t go camping that often but this is better than plastic cups.","picture":"/img/products/camp-mug.jpg","priceUsd":24.33,"categories":["cookware"]},{"id":"9SIQT8TOJO","name":"City Bike","description":"This single gear bike probably cannot climb the hills of San Francisco.","picture":"/img/products/city-bike.jpg","priceUsd":789.5,"categories":["cycling"]},{"id":"6E92ZMYYFZ","name":"Air Plant","description":"Have you ever wondered whether air plants need water? Buy one and figure out.","picture":"/img/products/air-plant.jpg","priceUsd":12.29,"categories":["gardening"]}]}'
recommendationsJson = JSON.parse(recommendationsJson);

// var products = responseJson["products"];
// if (recommendationsJson["productIds"] && recommendationsJson["productIds"].length > 0) {
//         for (var i = 0; i < products.length; i++) {
//                 var product = products[i];
//                 if (recommendationsJson["productIds"].indexOf(product["id"]) >= 0) {
//                         product["featured"] = true;

//                 }
//         }
// }

responseJson["recommendations"] = recommendationsJson;

context.setVariable("response.content", JSON.stringify(responseJson));