# Move any existing dotfiles out of the way then stow.
# Usage: slide_and_stow <package> <target> [extra stow args, e.g. --no-folding]
function slide_and_stow() {
    package=$1
    target=$2
    shift 2
    stow -n "$@" "$package" -t "$target" 2>&1 | grep "existing target" | awk -F': ' '{print $2}' |
        while IFS= read -r file; do
            [ -n "$file" ] || continue
            backup=$target/dotfiles.bak/$file
            install -d "$(dirname "$backup")"
            echo "Sliding $file to $backup"
            mv "$target/$file" "$backup"
        done

    stow --restow "$@" "$package" -t "$target"
}
