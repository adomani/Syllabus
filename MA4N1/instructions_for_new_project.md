#  Creating a new project depending on `Mathlib`

##  Using the VSCode `Lean 4` extension

The Lean4 VSCode extension takes care of most of the steps that would require using the command-line!
Here is a sequence of steps that should get Lean installed on your computer and
a project depending on `Mathlib` running.

* Install [VSCode](https://code.visualstudio.com/).
* Within VSCode, install the [`Lean4` extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4).
* (Possibly opening a new file called `<someName>.lean` or simply assigning it `lean` as language): you should see a `∀` on the top right corner of an open Lean-tab.
* Clicking on the `∀`, should open a menu, that will allow you to perform several actions:
  * install `lean`/`lake`;
  * create a new project using Mathlib as a dependency;
  * download the Mathlib build cache;
  * ...

I do not use the `∀` menu too often, so let me know if the information above is out of date or confusing!

If the previous steps did not work for you, continue reading!

##  Unix-based installation from the command-line

Below are instructions on creating a new project using the command-line on Unix-based systems.
They may also work for MacOS or Windows, assuming that you have access to a terminal.

[Source: Mathlib](https://leanprover-community.github.io/install/project.html#creating-a-lean-project)

These instructions should work on Unix-based systems, assuming that you have already installed successfully `Lean` and `lake`.
These instructions *might* also work on MacOs/Windows, when typed in a terminal.

`proj` is the name of the project
```bash
proj='MA4N1_Theorem_proving_with_Lean'
```

Initialize the new project &ndash; takes some time
```bash
lake +leanprover/lean4:nightly-2024-04-24 new "${proj}" math
```

Go inside the newly created folder, that has the same name as the project
```bash
cd "${proj}"
```

Download `mathlib` and its dependencies (`batteries`, `quote4`, `aesop`, `ProofWidgets4`, `lean4-cli`, `import-graph`, `LeanSearchClient`)
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
       |-- lean-toolchain
       |
       |-- proj.lean
       |
       |-- .lake/
```

In case you are curious, this is what the files above do.
* `lakefile.lean`: configuration of options and what gets built with `lake build`.
* `lake-manifest.json`: information about depedencies of your project.
* `lean-toolchain`: which version of the `Lean4` language you are using (this is still evolving quickly and roughly every month there is an update).
* `.lake/`: a hidden folder containing the information that Lean produces once it builds a file.
* `proj.lean`: it is common for this file to simply consist of lines of the form `import XXX`,
  where `XXX` ranges among the files in the `Proj` folder that you want Lean to build when running `lake build`.

You will likely not have to look at any of these files.
The only possible exception is `lakefile.lean`, in case you want to set some special options (I will talk about this during the lectures).

For ease of copy-pasting, here are all the commands in a single code-block
```bash
proj=MA4N1_Theorem_proving_with_Lean
lake +leanprover/lean4:nightly-2024-04-24 new "${proj}" math
cd "${proj}"
lake update "${proj}"
lake exe cache get
mkdir "${proj}"
code .
```

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=71736#section-0)
