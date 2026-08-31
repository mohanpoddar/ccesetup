## Ansible Vault password setup for root
When running Ansible as root, configure the vault password environment like this:

```bash
sudo -i
echo 'export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible_vault_pass' >> ~/.bashrc
echo 'export EMAIL_PASSWORD=xxxxxxxxxxxx' >> ~/.bashrc
source ~/.bashrc
```

Then create the password file manually and set its permissions:

```bash
echo "your_vault_password_here" > ~/.ansible_vault_pass
chmod 600 ~/.ansible_vault_pass
```

This keeps the vault password outside the repository and allows Ansible to decrypt encrypted files automatically when the playbook runs.

## Recommended Next Step
For stronger protection against ransomware, keep at least one additional offline or offsite backup copy.
