import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import { logger } from "firebase-functions";

initializeApp();

logger.info("Firebase app initialized");

export default getFirestore();
export { logger };
