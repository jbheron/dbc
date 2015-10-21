## Letter to a new committer…

I want to walk you through a basic git workflow… The git pattern I use ninety percent of the time.

I try not to work on master. When I start working on a project I’m either cloning or initializing like:

``` bash
git clone git@github.com:strand/dude.git
# Clones the remote repository from github.
```

**OR**

``` bash
git init
# Initializes the repo
git add .
# adds everything in the current directory (aka `.`)
git commit -m "First commit!!! WHooOoo0!"
# Commits changes with a message.
```

I try not to work on master ever. Instead, I checkout new branches for any work that I want to start with:

``` bash
git checkout -b new_branch
# creates and checks out a branch called new_branch
```

This is essentially an alias for these two commands:

``` bash
git branch new_branch
# creates a branch called new_branch
git checkout new_branch
# checks out a branch called new_branch
```

Then I go ahead and do some awesome work. Every time I make substantial progress, even if it’s just a few lines of code, I tend to make a commit. It’s easier to get rid of too many commits in the future than to break up too few commits well.

Usually I add files like this:

``` bash
git add app/controllers/giraffes_controller.rb
# Adds the giraffe controller.
```

**OR**

``` bash
git add -p
# Progressively add chunks of code from the changed files in the project.
```

And then I’ll double check that I’ve staged my changes with:

``` bash
git status
# Gives me the current staged status, which I use to verify that I have the files I want ready for committing.
```

Sometimes I make mistakes, and I might have added a file I don’t want in the current commit to the staging area, when this happens I run:

``` bash
git reset config/twitter.yml
# Unstages the file, keeping it on the file system, but preventing the changes from being commited.
```

When things are looking good, I commit with:

``` bash
git commit -m "Add create action to giraffe controller."
```

and then I push up with

``` bash
git push origin new_branch
```

I repeat this process for several commits, until I think my feature is complete. Then I go to github and [submit a pull request](https://help.github.com/articles/creating-a-pull-request) to master. A team member [reviews my code](https://help.github.com/articles/using-pull-requests), and if it doesn’t complete the feature, they comment and may close the PR or let me know what I can do to complete the feature. **Once the feature is completed, the PR is merged into master**. On my local machine I pull down the remote master with:

``` bash
git checkout master
git pull origin master
```

And then I start the cycle again with:

``` bash
git checkout -b new_new_branch
```

_Regards,
Strand_