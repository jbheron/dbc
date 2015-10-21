
##Git Workflow for Team Projects


### Create a new local repo (and connect it to GitHub)

1) Create and initialize your local repo
```
mkdir <your_project_dir>
cd <your_project_dir>
git init
```
2) Create initial files and commit them
```
git add .     # adds all the files in your directory to the stage
git commit -m "added initial files"   # commits your stage to your local repo
```
3) Connect the local repo to the URL of the repo on GitHub (see *Create your repo on Github* below)
```
git remote add origin https://github.com/<cohort-name-2014>/<project-name>.git  
```
4) Update the master branch on GitHub
```
git push -u origin master   #this is the only time your push to master! the very first commit.
```

### Create a new empty repo on Github
- go to github.com/cohort-name-2014
- create a new repo (look for the plus icon in the upper left corner)
	- name your repo the same as your local project (for consistency)
- use the url of your repo when you `git remote add origin` above
- add the students team as collaborators?

### Work locally on your own branch
- create a new branch
`git co -b feature_name`
- add and commit often
```
git add file_name(s)`    # or `git add .` to add all files that have been updated
git commit -m"commit message that is descriptive"
```


### Updating your repo on GitHub

1) Update your local master branch
```
git -co master
git pull origin master
```
2) Merge your updated master into your personal branch 
```
git co your_branch_name 
git merge master     # from your branch, integrate changes from master
```

3) Update your branch on GitHub
```
git push origin your_branch_name 
```
4) Integrate your branch into Github master
- go to repo on github.com, issue a pull request
- merge the pull request (should be done by other team members)


