# env-shell-loader

This is a simple set of bash functions to check for an `.env` file whenever you `cd` into a directory, and load the file's contents into the current shell as env vars. These env vars will be removed once you `cd` out of the directory and into a parent directory (not a child directory).

The idea is based on the Node [dotenv](https://www.npmjs.com/package/dotenv) lib, which loads any env vars defined in a `.env` file.

The functions in the `env-shell-loader.sh` are to be added to your `.bash_profile` for bash and `.zshrc` for zsh.

For a more robust solution, see [direnv](https://direnv.net/).
