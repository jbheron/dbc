##Overview

In Phase 1, you will begin using git and GitHub to submit challenges instead of using Socrates.  We'll walk you through using the repo to submit a challenge.


### Submitting a Challenge through GitHub

In Phase 1 and beyond, there will usually be one repo per challenge, and each repo will contain a README.md that contains the overview and instructions of the challenge.

Here are the step-by-step instructions correctly submit your solution.

####1) CLONE THE REPO AND SET UP YOUR PAIR
From the terminal, clone the challenge repo and then `cd` into it.  In your browser, you can find the clone url in the GitHub sidebar.  Notice you are cloning the repo with the `http:` address and not the `git@github.com:` address.

```
git clone https://github.com/test-cohort-2014/test-challenge.git
cd test-challenge
weare brickthorn amgando        # your two github names
```

####2) CREATE A BRANCH
Now we're going to create a branch! To do this we use the `git branch` command. `git branch` on its own lists out all local branches, but when you give it an argument it creates a new branch. A new branch is a copy of the current branch with a different name. (Check out a tutorial on [git branching](http://pcottle.github.io/learnGitBranching/)).

In your terminal, run the following command (replacing COHORT_NAME_and_YOUR_NAME with your cohort name and your full name:

``` shell
git checkout -b YOUR_NAME_and_PAIR_NAME

# this is a shortcut for these commands:
git branch YOUR_NAME_and_PARTNER_NAME
# creates a branch called YOUR_NAME_and_PARTNER_NAME
git checkout YOUR_NAME_and_PARTNER_NAME
# checks out a branch called YOUR_NAME_and_PARTNER_NAME

# to see the branches that have been created locally, type:
git branch

```


####3) ADD A FILE TO YOUR BRANCH

Add and commit updagtes to your file to the project with the following commands:

``` shell
git add filename1
# Stages filename1 to the repo.
# Alternatively, use "git add ." to stage changes to all files in the repo

git commit -vm "Added my quirk!"
# Commits the staged change to the repo with the message above.
# "-vm" is the combination of "-v" and "-m"

# Check out the status of your staged commits by typing:
git status
```
####4) PUSH THE BRANCH TO GITHUB
Here's how to do it:

``` shell
git push origin YOUR_NAME_and_PAIR_NAME
```

Now, let's make sure it's actually up on GitHub. Go back to the challenge repo. In the white bar at the top of the page, you'll see counts for `commits`, `branches`, `releases`, and `contributors`.  Click on the branches link.  The branches page contains all the solutions submitted by students.  Make sure your branch is there!

Confused about what the difference between git and github is?  This [explanation](http://www.jahya.net/blog/?2013-05-git-vs-github) may help.

####5) SUBMIT YOUR SOLUTION

You've created a new branch on the challenge and have pushed it up to GitHub.  It's named after you and your partner, so you should get some credit!  But to finalize the process, you'll need to submit a "pull request", which will send a notification to teachers that your solution is complete and ready to be reviewed.

Click on the branch that you created.  Right over the blue tab above your latest commit, click on the `Pull Request` link.  This page contains a request to merge your solution (your changes) into the Master branch.

Be sure to hit the **Edit** button at the top of the page to select the "base fork" so that your pull request is made to your cohort's version of the handbook. (See also: [Changing the branch range and destination repository in Github's docs](https://help.github.com/articles/using-pull-requests#changing-the-branch-range-and-destination-repository).)

If you were working on a real group project, you would post a comment for other contributors about the branch.  In this case, just make the comment be "challenge submission", and click "Send pull request".

You've just submitted a solution!


####6) UNPAIR YOUR GIT LOGINS

When you're done pairing, type `weare out`.
