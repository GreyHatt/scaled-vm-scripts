# scaled-vm-scripts

There's a `auto_scale.sh` bash file in which code is checking the CPU usage and if it's beyond 75% script will create gcloud compute instance.

Before executing above scripts we need to install some libraries for monitoring, load, and usage of gcp cli. For that I've create an installation file `install.sh`.

You will need to edit to set-up gcp stuff.

## Tips:
1. Run `install.sh` 
2. Run `auto_scale.sh`


<img width="907" alt="Screenshot 2025-03-22 at 7 38 26 PM" src="https://github.com/user-attachments/assets/4be57e64-4660-4929-ab75-a4b556a2c82a" />
