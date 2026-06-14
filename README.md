# Carebot assignment

Work for the L2 support engineer assignment.

Files:

- `answers.md` - answers for task 1 and task 2
- `playbook.yml` - Ansible playbook for Orthanc in Docker
- `setup.sh` - small helper script to install Ansible deps and run the playbook

## Running task 3

This was written for a local Debian/Ubuntu or Fedora machine. On Debian/Ubuntu it can install Docker if Docker is missing. On Fedora it expects Docker to already be installed, because Fedora systems often have either Docker CE or Fedora's own Docker packages and mixing them can cause package conflicts.

Set an Orthanc password first. For example:

```bash
export ORTHANC_PASSWORD='my-local-orthanc-password'
```

Use your own password, not the example text.

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

The Docker image is pinned in the playbook instead of using `latest`, so future image updates should not change the setup unexpectedly.

## Changing the Orthanc password

Change the environment variable and run the script again:

```bash
export ORTHANC_PASSWORD='my-new-local-password'
./setup.sh
```

The playbook rewrites the config and recreates the Orthanc container when the config changes. Uploaded DICOM data stays under `/opt/orthanc/storage`.
