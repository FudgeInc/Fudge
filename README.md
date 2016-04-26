#Fudge
**Fudge** is a collaborative recipe app where people can add new recipes or build off of recipes already submitted by other users.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/4yQARi5.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Required User Stories 
- [x] User can login/authenticate using Parse Login
- [x] Users can add recipes via an in app interface
- [x] Recipes are stored on a Parse instance
- [x] User can make a collaborative recipe collection using the user interaface
- [x] User can authenitcate/add a user(s) to edit collaborate on a recipe book

## Nice to Have
- [ ] Extension to add recipes from the web
- [ ] Parsing recipes from the web to put them in a nicer format
- [ ] Add Images to the recipes
- [x] Friends lists from facebook/contacts
- [ ] Ratings for recipes
- [ ] Ability to follow other users and see their recipes
- [ ] Ability to "fork" and modify another user's recipes

## Data Model

### User

|Atrribute|Type|
|---------|----|
|`UserName`| String|
|`ProfilePicture`| Image|

### Collection

|Atrribute|Type|
|---------|----|
|`Recipes`| Recipes[RecipeID]|
|`Owner`| PFObject|
|`Collaborators` | [PFUser] |
|`Name` | String |

### Recipes

|Atrribute|Type|
|---------|----|
|`RecipeID`| Int|
|`Name` | String |
|`Picture`| Image|
|`Description`| String |
|`Picture` | Image |
|`Steps` | [String] |
|`Creator`| PFObject |
|`Url`    | NSUrl |
|`Collections` | [String] |
