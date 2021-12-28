# _ebSuperBin

Script to download a supermassive (black hole) archive, which is a collection of binaries used for creative coding etc.

Don't run this download and install script unless you are me or you trust me. You have no simple way of verifying the integrity and functionality of the binary (which contains many binaries) it downloads.


## PREREQUISITES
`p7zip`. You may install it with this command from an `MSYS2` terminal on Windows:

    pacman -S --noconfirm p7zip

For MacOS, via `homebrew`:

    brew install p7zip

Then, if you trust me, with `p7zip` (`7z`) in your PATH, from a GNU / Mac / Bash or emulated such environment, and with the terminal open to the directory of this repository, examine the `get_ebSuperBin.sh` script, and if you agree with it, run it:

    ./get_ebSuperBin.sh


### TO DO

A more ideal distribution scheme than download and install of a monstro archive, without even any thought whatever for whether you can trust it and the binareis in it. `chocolatey` packages on Windows, and other package manager on Mac? List and file hash checks for extracted files where that's infeasible?

## BINARIES DISTRIBUTION DESCRIPTION

The extracted files from the `_ebSuperBin.7z` are:

Binary windows (and maybe other platforms) utilities collection, which can be quickly added to your `%PATH%` via [_ebPathMan](https://github.com/earthbound19/_ebPathMan).

I believe that everything here is at least freely available and/or open source. If you are the copyright owner of anything in this archive and wish for it to be removed, please contact me and I will do so:

ansible 1 @ earthbound dot io

It may be in flux as I freely add/upgrade/remove utilities at will.

### BINARY ETC. SOURCES

Things in this collection are from all over. It would be good to document sources. Here's a start: 
- wget.exe: static compile, with https support, [from over here](https://eternallybored.org/misc/wget/).


## INSTALLATION AND SUGGESTED USAGE:

Git pull this git repo to `\Documents`. (or anywhere else you want it), cd into the new directory, and run the download and extract script:

    `./get_ebSuperBin.sh`

I used to make a junction link to this directory, pointed to e.g. from one C:\_ebSuperBin folder, and put that same path in the system or user `%PATH%` (maybe via [_ebPathMan](https://github.com/earthbound19/_ebPathMan)). Now I just put it in `\Documents`.

To create a junction link, see [Link Shell Extension](http://schinagl.priv.at/nt/hardlinkshellext/linkshellextension.html).

## DEV HISTORY (reverse chronological):
- 2021-12-27 added sha256sum check to downloaded archive for elemental "is this the archive I made?" security / version control. Cleaned up / updated README.md.
- 2020-08-19 destroyed repo (off GitHub), and redistribute as .7z archive, and recreate repo with only this README.md and a script that points to .7z archive to download. Still not idea, but this practically broke git, which is not for huge collections of huge binaries.
- 2018-04-25 Replace /gnuCoreUtilsWin32/gsed.exe with sed compile found via https://github.com/mbuilov/sed-windows
- 2018-01-04 After eagerly trying LFS for Git(Hub), ran into GitHub's data use limit (very quickly), and [NO, Github](https://medium.com/@megastep/github-s-large-file-storage-is-no-panacea-for-open-source-quite-the-opposite-12c0e16a9a91). I can't clone the repo to work out a merge conflict. Deleted repo from git and resurrected--*without LFS*. Will use git BFG to periodically purge the blob of old, large file versions.
- 2017-12-02 Had deleted repo for monstrous, unworkable clones (which include git's blob collation of every binary file revision), but found out about git-lfs, and have resurrected repo in hopes of that last minimizing clone/pull/add/commit/push operations.
- 2017-06-07 PM Moved out of _ebdev (previously _devtools) into this here collection folder, periodically 7-zipped and uploaded at: http://earthbound.io/dist/eb_super_bin/_ebSuperBin.7z
- 2015-09-02 This was initially a project of only font development scripts. I upgraded it to be a repository of executables and scripts I use (and wrote).
