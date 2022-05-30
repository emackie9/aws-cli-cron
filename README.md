# aws-cli-cron
Alpine image that has aws-cli installed and runs cron. Mount crontabs into `/cron` directory on the docker.

Example cron file:

```cron
# must be ended with a new line "LF" (Unix) and not "CRLF" (Windows)
 * * * * * /usr/bin/aws s3 sync /sync_dir s3://my_storage_bucket/sync_dir  --delete  --storage-class DEEP_ARCHIVE > /proc/1/fd/1 2>/proc/1/fd/2
# An empty line is required at the end of this file for a valid cron file.

```

Run it:

```bash
docker run \
    --restart=always \
    --name=aws-cli-cron \
    --env TZ=America/Toronto \
    -v ./cronfile:/cron/cronfile \
    -v ./sync_dir:/sync_dir \
    emackie/aws-cli-cron:latest 
```
