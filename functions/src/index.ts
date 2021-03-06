import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();

const db = admin.firestore();
const fcm = admin.messaging();
export const sendToTopic = functions.firestore
	.document("notifications/{Id}")
	.onCreate(async snapshot => {
		const notification = snapshot.data();

		const payload: admin.messaging.MessagingPayload = {
			notification: {
				title: "New Notification!",
				body: notification.title,
				icon: "https://drive.google.com/file/d/1a7pTp20Owel2Q1KGhlFuX-YlkLxhLulP/view?usp=sharing",
				click_action: "FLUTTER_NOTIFICATION_CLICK" // required only for onResume or onLaunch callbacks
			}
		};
		switch (notification.yearid) {
			case 9:
				return fcm.sendToTopic("Ihsan", payload);
			case 10:
				return fcm.sendToTopic("Watan", payload);
			case 12:
				return fcm.sendToTopic("Serotonin", payload);
			case 13:
				return fcm.sendToTopic("Wareed", payload);
			case 14:
				return fcm.sendToTopic("Nabd", payload);
			case 15:
				return fcm.sendToTopic("Wateen", payload);
			case 16:
				return fcm.sendToTopic("2021", payload);
			default:
				break;
		}

	});