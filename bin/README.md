# Utilities

**The following tools are useful during debugging and development**

`accounts-generation.sh` generate accounts

`accounts-list.sh` shows the accounts available in the `earth` container.

`bash.sh` connects to the `earth` container opening a bash prompt.

`build-and-run.sh` runs build.sh and then run.sh.

`build.sh` builds the local image `spark`.

`healthcheck.sh` verifies Spark's express server is running.

`logs-fullnode.sh` see the full node logs.

`ps.sh` run `ps aux` in docker container.

`push.sh` push version and tag to docker hub.

`run-no-accounts.sh` run Spark and generate 1 account.

`run-official` run `latest` tag of Spark from docker hub.

`run-persistent.sh` runs Spark using local folders for data persistence, generating a `earth` container.

`run-preapproved.sh` run Spark with preapproved proposals.

`run-simple.sh` simple Spark.

`run.sh` runs `spark` generating an `earth` container on ports 8090, 8091 and 8092.

`tag.sh` tags a new `spark` image in preparation of a push to the Docker Hub.

`verify.sh` verifies the full node, solidity node and eventServer are listening.

<!-- `run-previous-latest.sh` runs latest released version of `earthengineering/spark` on ports 88090, 88091, 88092 and 89090 (to avoid conflicts with the work-in-progress `spark` which runs, typically, on ports 8090, 8091, 8092 and 9090). -->
