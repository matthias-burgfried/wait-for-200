# wait-for-status
Wait for given HTTP Status then exit (default 200)

```
docker run --rm -e URL=http://www.example.org -e STATUS=200 -e TIMEOUT=30 -e EXTRA=10 daseddy/wait-for-status
```
Wait for a maximum of 30 seconds (-e TIMEOUT=30) for http://www.example.org to return the status code 200 (-e STATUS=200).Then wait another 10 seconds (-e EXTRA=10).
