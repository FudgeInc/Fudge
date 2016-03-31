#Fudge
**Fudge** is a collaborative recipe app where people can add new recipes or build off of recipes already submitted by other users.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/6EwR19I.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Required User Stories 
- [x] User can login/authenticate using Parse Login
- [ ] Users can add recipes via an in app interface
- [ ] Recipes are stored on a Parse instance
- [x] User can make a collaborative recipe collection using the user interaface
- [ ] User can authenitcate/add a user(s) to edit collaborate on a recipe book

## Nice to Have
- [ ] Extension to add recipes from the web
- [ ] Parsing recipes from the web to put them in a nicer format
- [ ] Add Images to the recipes
- [ ] Friends lists from facebook/contacts
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
