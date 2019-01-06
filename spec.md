# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category) - User, Book, Review
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many reviews
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Review belongs_to user
- [x] Include user accounts with unique login attribute (username or email) - unique email required
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - can create, read, update, and destroy reviews
- [x] Ensure that users can't modify content created by other users - users can't modify reviews belonging to other users
- [x] Include user input validations - signup must have no blank fields, reviews must have content
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - error messages are displayed e.g. "No field can be blank" on sign up
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
