#### Change Ubuntu hostname

- Type the following command to edit /etc/hostname using nano or vi text editor:

```shell
sudo nano /etc/hostname
```

- Delete the old name and setup new name.
- Next Edit the /etc/hosts file:

```shell
sudo nano /etc/hosts
```

- Replace any occurrence of the existing computer name with your new one.
- Reboot the system to changes take effect:

```shell
sudo reboot
```

---

#### Change Ubuntu IP address

- [Shell script](./ip_change.sh)

---
