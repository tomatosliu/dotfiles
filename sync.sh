rsync -av --progress ~/.vim_runtime/ vim/ --exclude ~/.vim_runtime/temp_dirs/ || true
rsync -av --progress ~/.oh-my-zsh/ oh-my-zsh/ || true
cp ~/.config/flake8 flake8 || true
cp ~/.config/pep8 pep8 || true

