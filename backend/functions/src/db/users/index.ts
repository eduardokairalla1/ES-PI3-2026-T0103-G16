/**
* IMPORTS
*/
import { log } from "firebase-functions/logger";
import db from "../../configs";
import { logger } from "../../configs";


/**
* TYPES
*/
import type { IUserInput, IUser } from "./index.d";


/**
* CODE
*/

/**
 * I add a user.
 *
 * @param input user input
 *
 * @returns user added
 */
export async function addUser(input: IUserInput): Promise<IUser> {

    const now = new Date().toISOString();

    const res = await db.collection("users").add({
        ...input,
        created_at: now,
    });

    const user: IUser = {
        uid: res.id,
        ...input,
        created_at: now,
        updated_at: now,
    };

    logger.info("User added", user);
    logger.info(res);

    return user;
}
