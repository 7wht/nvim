temp run with podman:
```
podman run --rm -it archlinux bash -c "pacman -Sy --needed --noconfirm git nvim;
  git clone --depth=1 https://github.com/7wht/nvim ~/.config/nvim;
  pacman -S --needed --noconfirm $(cat ~/.config/nvim/dependencies);
  cd /home; nvim; bash"
```
