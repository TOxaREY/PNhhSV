var apn = require('apn');
var timerReq = setInterval(function() {
	var today = new Date();
	console.log('req' + today);
	var arrNameFull = [];
	var arrNameFullString = [];
	var arrId = [];
	var arrIdT = [];
	var arrIdServer = [];
	var arrName = [];
	var arrNumberForRemove = [];
	var arrFull = [];
	var arrFinish = [];
	var tokenDevice = '';
	var XMLHttpRequest = require('xmlhttprequest').XMLHttpRequest;
	httpNA = "http://133.133.133.133:8000/hh/5dc07f91191ea01605298d4d";
	httpID = "http://133.133.133.133:8000/hh/5dc197b3c3f9d606c5609124";
	httpN = "http://133.133.133.133:8000/hh/5dc07f8a191ea01605298d4c";
	httpT = "http://133.133.133.133:8000/hh/5dc075d1191ea01605298d4b";
	xhrNA = new XMLHttpRequest();
	xhrID = new XMLHttpRequest();
	xhrIDP = new XMLHttpRequest();
	xhrN = new XMLHttpRequest();
	xhrT = new XMLHttpRequest();
	xhrNA.open('GET', httpNA, false);
	xhrID.open('GET', httpID, false);
	xhrN.open('GET', httpN, false);
	xhrT.open('GET', httpT, false);
	xhrNA.timeout = 3000;
	xhrID.timeout = 3000;
	xhrN.timeout = 3000;
	xhrT.timeout = 3000;
	xhrNA.send();
	xhrID.send();
	xhrN.send();
	xhrT.send();
	if (xhrNA.status == 200) {
		json = JSON.parse(xhrNA.responseText);
		var nameArray = json.nameArray;
	};
	if (xhrID.status == 200) {
		json = JSON.parse(xhrID.responseText);
		var id = json.id;
	};
	if (xhrN.status == 200) {
		json = JSON.parse(xhrN.responseText);
		var name = json.name;
	};
	if (xhrT.status == 200) {
		json = JSON.parse(xhrT.responseText);
		tokenDevice = json.tokenDevice;
	};
	function putArrIdM() {
		var data = "id=" + arrIdServer;
		xhrIDP.withCredentials = true;
		xhrIDP.open('PUT', httpID);
		xhrIDP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhrIDP.setRequestHeader("Cache-Control", "no-cache");
		xhrIDP.timeout = 3000;
		xhrIDP.send(data);
	};
	function createArray(string) {
		var string2 = string.replace(/["]+/g, '');
		var string3 = string2.replace('[', '');
		var string4 = string3.replace(']', '');
		var string5 = string4.replace(/[' ']+/g, '');
		var arr = string5.split(',');
		return arr;
	};
	arrName = createArray(nameArray);
	arrId = createArray(id);
	var responseArray = [];
	httpsHH = "https://api.hh.ru/vacancies?text=" + name + "&area=1&page=0&per_page=100"; 
	var xhrHH = new XMLHttpRequest();
	xhrHH.open('GET', httpsHH, false);
	xhrHH.setRequestHeader('User-Agent', 'api-test-agent');
	xhrHH.timeout = 3000;
	xhrHH.send();
	if (xhrHH.status == 200) {
		json = JSON.parse(xhrHH.responseText)
		for(var i = 0; i < json.items.length; i++) {
			arrNameFull.push(json.items[i].name)
		};
		arrFull = json.items;
	};
	toLower = function(x){ 
		return x.toLowerCase();
	};
	if (arrName.length != 0 && arrNameFull.length != 0) {
		arrName = arrName.map(toLower);
		arrNameFull = arrNameFull.map(toLower);
		for(var i = 0; i < arrNameFull.length; i++) {
			arrNameFullString.push(arrNameFull[i].replace(/\s/g, ''));
		};
		var x = arrName.length;
		for(var i = 0; i < arrNameFullString.length; i++) {
			for(var j = 0; j < arrName.length; j++) {
				if (arrNameFullString[i].indexOf(arrName[j]) != -1) {
					x--;
				};
				if (j == arrName.length - 1 && x != 0) {
					arrNumberForRemove.push(i);
				}
				if (j == arrName.length - 1) {
					x = arrName.length;
				};
			};
		};
		if (arrNumberForRemove.length != 0) {
			for(var i = 0; i < arrNumberForRemove.length; i++) {
				arrFull[arrNumberForRemove[i]].name = '';
			};
			arrFinish = arrFull.filter(function(name) {
				return name.name != '';
			});
		} else {
			arrFinish = arrFull;
		};
		for(var i = 0; i < arrFinish.length; i++) {
			arrIdServer.push(arrFinish[i].id)
		};
		// arrIdServer.push('12345');
		// arrIdServer.splice(0, 1);
		if (arrIdServer.length > arrId.length) {
			console.log('arrIdM: ' + arrId);
			console.log('arrIdS: ' + arrIdServer);
			console.log('+');
			putArrIdM();
			notif(tokenDevice,'+','runeDD.aiff');
		};
		if (arrIdServer.length < arrId.length) {
			console.log('arrIdM: ' + arrId);
			console.log('arrIdS: ' + arrIdServer);
			console.log('-');
			putArrIdM();
			notif(tokenDevice,'-','silence.aiff');
		};
		var y = 1;
		var z = 0;
		if (arrIdServer.length == arrId.length) {
			for(var i = 0; i < arrIdServer.length; i++) {
				for(var j = 0; j <arrId.length; j++) {
					if (arrIdServer[i].indexOf(arrId[j]) != -1) {
						y--;
					};
					if (j == arrId.length - 1 && y == 0) {
						z++;
					};
					if (j == arrId.length - 1) {
						y = 1;
					};
				};
				if (i == arrIdServer.length - 1 && z != arrIdServer.length) {
					console.log('arrIdM: ' + arrId);
					console.log('arrIdS: ' + arrIdServer);
					console.log('!=');
					putArrIdM();
					notif(tokenDevice,'+','runeDD.aiff');
				};
			};
		};
	};
}, 1800000);
// Function notification
function notif(deviceToken,badge,sound) {
// Set up apn with the APNs Auth Key
var apnProvider = new apn.Provider({  
	token: {
        key: 'apnsHH.p8', // Path to the key p8 file
        keyId: '567WER1234', // The Key ID of the p8 file (available at https://developer.apple.com/account/ios/certificate/key)
        teamId: 'E456644SD4', // The Team ID of your Apple Developer Account (available at https://developer.apple.com/account/#/membership/)
    },
    production: false // Set to true if sending a notification to a production iOS app
});
// Prepare a new notification
var notification = new apn.Notification();
// Specify your iOS app's Bundle ID (accessible within the project editor)
notification.topic = 'qwerty.PNhhSV';
// Set expiration to 1 hour from now (in case device is offline)
notification.expiry = Math.floor(Date.now() / 1000) + 3600;
// Send any extra payload data with the notification which will be accessible to your app in didReceiveRemoteNotification
notification.payload = {id: 123};
// Display the following message (the actual notification text, supports emoji)
if (badge == '+') {
	notification.alert = "Новая вакансия";
	notification.badge = 1;
}; 
if (badge == '-') {
	notification.alert = "Вакансия снята";
	notification.badge = 0;
};
// Play ping.aiff sound when the notification is received
notification.sound = sound;
// Actually send the notification
apnProvider.send(notification, deviceToken).then(function(result) {  
// Check the result for any failed devices
console.log(result);
apnProvider.shutdown();
})
};

