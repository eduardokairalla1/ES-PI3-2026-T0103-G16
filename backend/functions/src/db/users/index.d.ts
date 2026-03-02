export type UserStatus = "active" | "inactive" | "suspended";

export interface IUserInput {
  full_name: string;
  email: string;
  status: UserStatus;
}

export interface IUser {
  uid: string;
  full_name: string;
  email: string;
  status: UserStatus;
  created_at: string;
  updated_at: string;
}
