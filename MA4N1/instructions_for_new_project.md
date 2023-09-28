#  Creating a new project depending on `Mathlib`

[Source URL](https://leanprover-community.github.io/install/project.html#creating-a-lean-project)

`proj` is the name of the project
```bash
proj=MA4N1_2023
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

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
