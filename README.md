# Fudge
**Fudge** is a collaborative recipe app where people can add new recipes or build off of recipes already submitted by other users.

# Data Model

| User|    Collection | Recipes |
--------- | ----------| ---------|
UserName  |  Recipes[RecipeID] | RecipeID
ProfilePicture| Collaborators[UserNames] | Ingredients
	| Owner | Description
	|     | Picture
	|     | Steps
	|     | Creator
	|     | Url
	
###User

|Atrribute|Type|
|---------|----|
|`UserName`| String|
|`ProfilePicture`| Image|



#Required User Stories 
- [ ] User can login/authenticate using Parse Login
- [ ] Users can add recipes via an in app interface
- [ ] Recipes are stored on a Parse instance
- [ ] User can make a collaborative recipe collection using the user interaface
- [ ] User can authenitcate/add a user(s) to edit collaborate on a recipe book

#Nice to Have
- [ ] Extension to add recipes from the web
- [ ] Parsing recipes from the web to put them in a nicer format
- [ ] Add Images to the recipes
- [ ] Friends lists from facebook/contacts
- [ ] Ratings for recipes
- [ ] Ability to follow other users and see their recipes
- [ ] Ability to "fork" and modify another user's recipes
