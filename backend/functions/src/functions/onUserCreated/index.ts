import { auth } from "firebase-functions/v1";
import { addUser } from "../../db/users";
import { logger } from "../../configs";

async function handleOnUserCreated(user: any) {
    try {
        await addUser({
            full_name: user.displayName,
            email: user.email,
            status: "active",
        });

    }

    catch (error) {
        logger.error("Failed to create user", { uid: user.uid, error });
        throw error;
    }
}



export const onUserCreated = auth.user().onCreate(handleOnUserCreated);
