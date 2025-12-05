
# Move any existing dotfiles out of the way then stow.
function slide_and_stow() {
    package=$1
    target=$2
    files=$(stow -n ${package} 2>&1 | grep "existing target" | awk -F': ' '{print $2}')
    for file in $files; do
        backup=$target/dotfiles.bak/$file
        install -d $(dirname $backup)
        echo "Sliding $file to $backup"
        mv $target/$file $backup
    done

    stow --restow $package -t $target
}

