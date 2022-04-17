<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/163709998-10d46c9c-9ab9-404e-8940-2123300ad82e.png" draggable="false" ondragstart="return false;" alt="nodo Title" title="nodo" /></a></p>

Most of the time node_modules directory contains thousands or even millions
of files, taking up a lot of disk or cloud storage space. Why would someone
want to have those monstrously sized node_modules folders on inactive
projects? You have your package.json to recreate it whenever you want, right?

Working on a Mac, [iCloud][apple-icloud] runs constantly in the background,
syncing files across devices. This small utility helps you prevent this, nodo
helps prevent filling your iCloud storage from the node_modules un-syncing
the directory or to save more space by removing all node_modules directories
within the chosen root directory. Useful for cleaning up a project that has
more than one node_modules tree.
<br/><br/>

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

The script will look for the `zshrc` and then append the full path to the
`nodo/script` directory to the `fpath`:

```shell
fpath=(~/nodo/script $fpath)
autoload -Uz nodo
```

### Install via [Oh My Zsh][ohmyzsh]

```shell
git clone https://github.com/nicolodiamante/nodo.git $ZSH_CUSTOM/plugins/nodo
```

- Add to your `zshrc` plugins array `plugins=(... nodo)`
- Restart the shell to activate
<br/><br/>

## How to Use `nodo`

```shell
nodo [-n, --nosync] [-r, --remove]
```

- `nodo --nosync`: stop the sync of the node_modules directory into iCloud.

- `nodo --remove`: remove the node_modules directory within the chosen
root directory.

For full nodo options, see `nodo --help`.<br/><br/>

## Notes

When nodo is launched inside a git repository, it will search for the
.gitignore file, if it doesn't find it, it will create it otherwise it
will append node_modules to the existing one.

### Resources

- [Node.js][node-modules]

### Contribution

Please report any issues or bugs to the [issues page][issues]. Suggestions for
improvements are welcome!<br/><br/>

<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/113406768-5a164900-93ac-11eb-94a7-09377a52bf53.png" draggable="false" ondragstart="return false;" /></a></p>

<p align="center"><a href="https://github.com/nicolodiamante" target="_blank"><img src="https://user-images.githubusercontent.com/48920263/113433823-31a84200-93e0-11eb-9ffb-9111b389ef2f.png" draggable="false" ondragstart="return false;" alt="Nicol&#242; Diamante Portfolio" title="Nicol&#242; Diamante" width="11px" /></a></p>

<p align="center"><a href="https://github.com/nicolodiamante/nodo/blob/main/LICENSE.md" target="_blank"><img src="https://user-images.githubusercontent.com/48920263/110947109-06ca5100-8340-11eb-99cf-8d245044b8a3.png" draggable="false" ondragstart="return false;" alt="The MIT License" title="The MIT License (MIT)" width="90px" /></a></p>

<!-- Link labels: -->
[apple-icloud]: https://www.apple.com/icloud/
[ohmyzsh]: https://github.com/robbyrussell/oh-my-zsh/
[node-modules]: https://nodejs.org/api/modules.html
[issues]: https://github.com/nicolodiamante/nodo/issues
