# Execute script

Usage:
```bash
sh code-server.sh $1 $2
```
| param | usage |
| :---: | --- |
| $1 | Pre-install script that executed before the main script |
| $2 | Post-install script that executed after the main script |

Example:
```bash
curl -fsSL \
  https://github.com/dion-ricky/gcp-vm-startupscript/raw/main/code-server/ubuntu-18.04/code-server.sh \
  | sh -s -- "git clone https://github.com/dion-ricky/certify-service.git; cd certify-service"
```
