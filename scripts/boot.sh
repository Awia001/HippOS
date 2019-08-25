if grub-file --is-x86-multiboot $1; then
  echo multiboot yes
else
  echo multiboot no
fi
