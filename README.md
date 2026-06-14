# Carebot assignment

Work for the L2 support engineer assignment.

Files:

- `answers.md` - answers for task 1 and task 2
- `playbook.yml` - Ansible playbook for Orthanc in Docker
- `setup.sh` - small helper script to install Ansible deps and run the playbook

## Running task 3

This was written for a local Debian/Ubuntu or Fedora machine.

Set an Orthanc password first:

```bash
export ORTHANC_PASSWORD='your-password-here'
```

Then run:

```bash
./setup.sh
```

Optional username:

```bash
export ORTHANC_USERNAME='admin'
```

Orthanc should listen on:

- HTTP: `http://localhost:8042`
- DICOM: port `4242`, AE title `CAREBOT`
