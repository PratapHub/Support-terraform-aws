Retrieve your stashed changes by running the git stash apply command. This will apply the changes from the most recent stash to your current branch.
-->git stash apply

Make sure your working directory is clean by running git status. If you have any uncommitted changes, commit them before rebasing.
-->git status
-->git add <file>
-->git commit -m "Commit message"

Fetch the latest changes from the remote repository by running the git fetch command.
-->git fetch

Switch to the branch that you want to rebase.
-->git checkout <branch>

Start the interactive rebase process by running the git rebase -i command, followed by the commit that you want to rebase onto. For example, if you want to rebase onto the main branch, you can run the following command:

-->git rebase -i main

In the interactive rebase window, you can choose to keep, edit, or drop each commit. Make the necessary changes and save the file.

Resolve any merge conflicts that may arise during the rebase process.

Once you have resolved all conflicts and finished editing your commits, run the git rebase --continue command to complete the rebase process.
-->git rebase --continue

If you encounter any issues during the rebase process, you can abort the rebase by running the git rebase --abort command.
-->git rebase --abort
