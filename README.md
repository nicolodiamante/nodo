<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/nicolodiamante/nodo/assets/48920263/2f4529e1-f221-4838-a237-a6f40ce5cc27" draggable="false" ondragstart="return false;" alt="nodo" title="nodo" />
    <img src="https://github.com/nicolodiamante/nodo/assets/48920263/80bd2cf4-15e3-48f3-86ce-f6bf48d6b69c" draggable="false" ondragstart="return false; "alt="nodo" title="nodo" />
  </picture>
</p>

Node_modules directory is an essential component of Node.js projects, but it can often become a nuisance when it takes up too much disk or cloud storage space. It is not uncommon for node_modules directories to contain thousands or even millions of files. This can be a problem for inactive projects, as the folder can occupy valuable storage space. One might wonder why they would want to keep such large node_modules folders for inactive projects when package.json can recreate them anytime.

Fortunately, there is a solution to this problem. If you're working on a Mac, [iCloud][apple-icloud] runs in the background and can sync files across devices. However, this can fill up your iCloud storage quickly. To prevent this, you can use the nodo utility. It helps to un-sync the node_modules directory and save space by removing all node_modules directories within the chosen root directory. This is particularly useful for cleaning up a project that has multiple node_modules trees. By using this utility, you can free up valuable storage space and optimise your project.
<br><br>

## Getting Started

Here are the two methods you can choose from:

**Automatic Download via `curl`:** Simply execute the following command in your terminal to quickly download and seamlessly install the utility:

```shell
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/nicolodiamante/nodo/HEAD/bootstrap.zsh)"
```

**Manual Cloning:** For those who prefer a hands-on approach, you can manually clone the repository to your desired location:

```shell
git clone https://github.com/nicolodiamante/nodo.git ~/nodo
```

<br>

### Post-Download Steps

**Directory Navigation & Script Execution:** Navigate to the root directory of the repository, and then execute the installation script using the following command:

```shell
source utils/install.zsh
```

**Nodo Configuration**: This script aims to locate the `zshrc` file, then appends the path `nodo/script` to the `fpath` variable.

```shell
fpath=(~/nodo/script $fpath)
autoload -Uz nodo
```

<br>

### Install via [Oh My Zsh][ohmyzsh]

If you're using Oh My Zsh, you can install `nodo` as a plugin:

```shell
git clone https://github.com/nicolodiamante/nodo.git $ZSH_CUSTOM/plugins/nodo
```

Then, add `nodo` to your `.zshrc` plugins array:

```shell
plugins=(... nodo)
```

Restart theshell to activate the changes.
<br><br>

## How to use nodo

```shell
nodo [option]
```

Options:

- `--nosync`: Stop the sync of the `node_modules` directory into iCloud.
- `--remove`: Remove the `node_modules` directory within the chosen root directory.

For a comprehensive list of options and functionalities, use: `nodo --help`.
<br><br>

## Notes

When nodo is launched inside a Git repository, it will search for the .gitignore file. If it does not find it, it will create it. If it does find it, nodo will append node_modules to the existing .gitignore file. This ensures that the node_modules directory will be ignored by Git and will not be included in future commits, further optimising the project and saving valuable storage space.

<br>

### Resources

- [Node.js][node-modules]

### Contribution

Any suggestions or feedback you may have for improvement are welcome. If you encounter any issues or bugs, please report them to the [issues page][issues].
<br><br>

<p align="center">
  <picture>
    <img src="https://github.com/nicolodiamante/nodo/assets/48920263/c23cc85a-e811-44a1-a47b-e4d84ef7abfb" draggable="false" ondragstart="return false;" /></>
  </picture>
</p>

<p align="center">
  <a href="https://nicolodiamante.com" target="_blank">
    <img src="https://github.com/nicolodiamante/nodo/assets/48920263/ea2fbe5e-261f-4d16-b778-3a8232d03cda" draggable="false" ondragstart="return false;" alt="Nicol&#242; Diamante Portfolio" title="Nicol&#242; Diamante" width="17px" />
  </a>
</p>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/nicolodiamante/nodo/assets/48920263/2094140b-8538-4175-992d-1791d6a73ff8" draggable="false" ondragstart="return false;" alt="MIT License" title="MIT License" />
    <img src="https://github.com/nicolodiamante/nodo/assets/48920263/93b7ec71-f913-4d6f-b85a-34338dbcd8e8" draggable="false" ondragstart="return false; "alt="MIT License" title="MIT License" width="95px" />
  </picture>
</p>

<!-- Link labels: -->

[apple-icloud]: https://www.apple.com/icloud/
[ohmyzsh]: https://github.com/robbyrussell/oh-my-zsh/
[node-modules]: https://nodejs.org/api/modules.html
[issues]: https://github.com/nicolodiamante/nodo/issues
