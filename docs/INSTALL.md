# Install

> TODO(verify): fill in as M4–M6 land. Current targets below.

1. Boot the USB written with the UrukOS ISO (live session or installer).
2. Anaconda: choose language/keyboard/network/storage.
   - **Recommended storage:** manual partitioning, LUKS2 encryption of the root.
   - TPM2 auto-unlock is a post-install opt-in step: `anu tpm enroll` (passphrase stays as recovery).
3. User creation: new users get fish as the default shell (`/etc/skel`, `/etc/default/useradd`).
4. First boot:
   - `anu setup` — codecs (RPM Fusion only), Flatpak remotes (Flathub), app registry
   - `sudo dnf swap ffmpeg-free ffmpeg --allowerasing` (RPM Fusion only; no Terra mesa packages)
   - NVIDIA: RPM Fusion akmods + MOK enrollment (see Secure Boot section)
5. Secure Boot: works only with the unmodified Fedora shim/grub2/kernel packages shipped by UrukOS.
6. Third-party apps (VS Code, LM Studio, Burp, Cisco Packet Tracer, ...) are installed per-app via `anu install <id>`, which shows URLs/licenses before downloading.
