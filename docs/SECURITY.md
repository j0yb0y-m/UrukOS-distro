# Security

UrukOS defaults, per AGENT_README.md §7:

- **SELinux:** enforcing. No `setenforce 0` workarounds anywhere.
- **Firewall:** firewalld enabled by default, zone `public`, only `dhcpv6-client` allowed (owner confirms, D-2). `virbr0`/Podman interfaces go in `trusted`. Open pentest listeners on demand: `anu fw open <port>`.
- **Encryption:** LUKS2 as the documented default. TPM2 auto-unlock is opt-in (`anu tpm enroll`, passphrase remains).
- **Boot:** Secure Boot works only with unmodified Fedora shim/grub/kernel. No custom kernels. NVIDIA akmods require MOK enrollment (documented in INSTALL.md).
- **Updates:** DNF5, `gpgcheck=1` in every repo file we ship. The one-time Terra bootstrap command is `--nogpgcheck` by design and is documented as an exception.
- **Fedora 45 note:** unprivileged `ptrace` is restricted; document that `gdb -p`/`strace -p` on unrelated PIDs needs sudo or a sysctl change (do not silently disable).
- Any sysctl change that weakens security must carry a comment explaining why + a line here.
