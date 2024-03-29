#  Creating a new project depending on `Mathlib`

##  Using the new VSCode `Lean 4` extension

As of very recently (late October 2023), the Lean4 VSCode extension may take care of most of the steps that would require using the command-line!
Here is a sequence of steps that might get Lean installed on your computer and
a project depending on `Mathlib` running.

* Install [VSCode](https://code.visualstudio.com/).
* Within VSCode, install the [`Lean4` extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4).
* (Possibly opening a new file called `<someName>.lean` or simply assigning it `lean` as language): you should see a `∀` on the top right corner of an open Lean-tab.
* Clicking on the `∀`, should open a menu, that will allow you to perform several actions:
  * install lean/lake;
  * create a new project using Mathlib as a dependency;
  * download the Mathlib build cache;
  * ...

As I said, the functionality of the `∀` menu is very new, so the information above is subject to change and may be buggy!

If the previous steps did not work for you, continue reading!

##  Unix-based installation from the command-line

Below are instructions on creating a new project using the command-line on Unix-based systems.
They may also work for MacOS or Windows, assuming that you have access to a terminal.

[Source: Mathlib](https://leanprover-community.github.io/install/project.html#creating-a-lean-project)

These instructions should work on Unix-based systems, assuming that you have already installed successfully `Lean` and `lake`.
These instructions *might* also work on MacOs/Windows, when typed in a terminal.

`proj` is the name of the project
```bash
proj='MA4N1_2023'
```

Initialize the new project &ndash; takes some time
```bash
lake +leanprover/lean4:nightly-2023-02-04 new "${proj}" math
```

Go inside the newly created folder, that has the same name as the project
```bash
cd "${proj}"
```

Download `mathlib`, `std`, `aesop`, `Qq`, `Cli`, `proofwidgets`
```bash
lake update "${proj}"
```

Get the mathlib cache, so you do not have to build it locally
```bash
lake exe cache get
```

Create a new directory with the same name as the repo
```bash
mkdir "${proj}"
```

Open the *current* folder with VSCode

**This is important:** you should open the *folder* containing the project
not a file or an inner folder!
```bash
code .
```

All your files should be created inside the `proj` folder that *you* created,
not the one that was automatically created when you initialized your project

You folder structure should look more or less like this:
```
proj --|-- Proj -------------- | <your_files_here>
       |
       |-- lakefile.lean
       |
       |-- lake-manifest.json
       |
       |-- lake-packages
       |
       |-- lean-toolchain
       |
       |-- proj.lean
```


For ease of copy-pasting, here are all the commands in a single code-block
```bash
proj=MA4N1_2023
lake +leanprover/lean4:nightly-2023-02-04 new "${proj}" math
cd "${proj}"
lake update "${proj}"
lake exe cache get
mkdir "${proj}"
code .
```

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_2023)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_2023)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
