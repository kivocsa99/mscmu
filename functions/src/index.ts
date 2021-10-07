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
				title: "New Post!",
				body: notification.title,
				icon: "https://drive.google.com/file/d/1a7pTp20Owel2Q1KGhlFuX-YlkLxhLulP/view?usp=sharing",
				click_action: "FLUTTER_NOTIFICATION_CLICK" // required only for onResume or onLaunch callbacks
			}
		};
		switch (notification.yearid) {
			case 9:
				return fcm.sendToTopic("ihsan", payload);
			case 10:
				return fcm.sendToTopic("watan", payload);
			case 12:
				return fcm.sendToTopic("serotonin", payload);
			case 13:
				return fcm.sendToTopic("vien", payload);
			case 14:
				return fcm.sendToTopic("nabd", payload);
			case 15:
				return fcm.sendToTopic("wateen", payload);
			default:
				break;
		}

	});