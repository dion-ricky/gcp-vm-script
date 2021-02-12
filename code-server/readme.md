# Startup script

```bash
curl -fsSL \
  https://github.com/dion-ricky/gcp-vm-startupscript/raw/main/code-server/ubuntu-18.04/code-server.sh \
  | sh -s -- "git clone https://github.com/dion-ricky/certify-service.git; cd certify-service"
```
