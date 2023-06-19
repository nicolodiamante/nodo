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

Download the repository via curl:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nicolodiamante/nodo/HEAD/bootstrap.sh)"
```

Alternatively, clone manually:

```shell
git clone https://github.com/nicolodiamante/nodo.git ~/nodo
```

Head over into the directory and then:

```shell
cd utils && source install.sh
```

The script will look for the zshrc and then append the full path to the
`nodo/script` directory to the fpath:

```shell
fpath=(~/nodo/script $fpath)
autoload -Uz nodo
```

<br>

### Install via [Oh My Zsh][ohmyzsh]

```shell
git clone https://github.com/nicolodiamante/nodo.git $ZSH_CUSTOM/plugins/nodo
```

- Add to your zshrc plugins array `plugins=(... nodo)`
- Restart the shell to activate
<br><br>

## How to use nodo

```shell
nodo [-n, --nosync] [-r, --remove]
```

- `nodo --nosync` stop the sync of the node_modules directory into iCloud.

- `nodo --remove` remove the node_modules directory within the chosen
root directory.

For full nodo options, see `nodo --help`.
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
  <picture>
    <img src="https://github.com/nicolodiamante/nodo/assets/48920263/ea2fbe5e-261f-4d16-b778-3a8232d03cda" draggable="false" ondragstart="return false;" alt="Nicol&#242; Diamante" title="Nicol&#242; Diamante" width="17px" />
  </picture>
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
