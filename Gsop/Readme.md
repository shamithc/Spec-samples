## Gsop ##


Gsop is a Project Management tool designed for managing accounts, contacts, projects etc. Accounts relate to users who manages or creates a project. Contacts are users who can be added to a project by an account user. Projects are any undertakings by an account. Its main aim is to manage the projects created by accounts or users. The whole project is created with a responsive design. Regarding the relationships, a user created is assigned to a particular role. Any number of contacts and projects can be added to a account.

Technologies used:
    * Ruby, rails, bootstrap, factory_girl
    * Implemented cucumber selenium browser automated testing in the project.


###Sample Test cases:####

1.Accounts Controller Spec:

  The above specs are written for the creation of an accounts. The creation check for the valid params and increases the count of accounts as 1. It assigns the current account to @account and redirects to the accounts page. If the attributes are invalid then the account is not saved and it re-renders the account’s new page again.

2.Contacts Controller Spec:

 The above spec is written for the contacts. Here the specs are used to check the index, show and the edit actions of the contacts. It checks whether all the contacts are listed in the index page in the index. It shows the details of a particular contact in the show page. The edit checks for the valid params and allows the existing contact to be edited.

3.User Model Spec:

 User model spec checks for the username, email and password when creating a user. It checks for a valid email and rejects if the email is not unique. The spec checks for the valid params and only then allows for the creation of an user.
