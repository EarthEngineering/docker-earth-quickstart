# Earth Spark (Docker image)

Spark is a private and local EARTH network for development and testing. Fire up your EARTH development environment with Spark! ✨🔥

The image exposes:

- FullNode
- SolidityNode
- EventServer

## Usage

**Pull the image using docker:**

```
docker pull earthengineering/spark:latest
```

**Run the container:**

```
docker run -it \
  -p 9090:9090 \
  --rm \
  --name earth \
  earthengineering/spark:latest
```

Notice the `--rm` option automatically removes the container after it exits. This is very important because the container cannot be restarted, it MUST be run from scratch to correctly configure the environment.

**Verify the image is running correctly:**

```
docker exec -it earth ps aux
```

You should see something like this:

```
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0  20044  1900 pts/0    Ss+  01:42   0:00 bash ./spark v2.0.0
root        13  0.2  0.0  50148  1740 pts/0    Sl+  01:42   0:00 redis-server *:6379
root        15  0.0  0.0  20044    40 pts/0    S+   01:42   0:00 bash ./spark v2.0.0
root        16 11.5 19.2 5277964 393692 pts/0  Sl+  01:42   0:31 java -jar FullNode.jar -c fullnode.conf --witness
root        43  0.1  1.8 930932 37456 ?        Ssl  01:42   0:00 PM2 v3.3.1: God Daemon (/root/.pm2)
root        54  0.2  2.6 939316 54880 ?        Ssl  01:42   0:00 /earth/eventron/eventron
root        67  0.5  3.1 941540 64212 pts/0    Sl+  01:42   0:01 node /earth/app
root        72  412 32.0 5208448 655136 pts/0  Sl+  01:42  18:49 java -jar BlockParser.jar --Node-list 127.0.0.1 --intial-block 1 -end -1 --event-server http://127.0.0.1:8060 --secret-key TNSpckEZhGfZ4ryidHG2fYWMARLpZ6U139
root       261  0.0  0.1  20176  3748 pts/1    Ss   01:46   0:00 bash
root       289  0.0  0.1  36068  3168 pts/1    R+   01:47   0:00 ps aux
```

If redis-server, nodes, or the event server are not running, exit and run the container again.

To see the logs of the full node you can execute

```
docker exec -it earth tail -f /earth/FullNode/logs/earth.log
```

### EarthCli configuration

Configure your `earthcli.js` file as:

```
module.exports = {
  networks: {
    development: {
      privateKey: 'da146374a75310b9666e834ee4ad0866d6f4035967bfc76217c5a495fff9f0d0',
      fullHost: "http://127.0.0.1:9090",
      network_id: "9"
    }
  }
};
```

### EarthWeb configuration

Instantiate earthWeb as in the following example:

```
const EarthWeb = require('earthweb')

const earthWeb = new EarthWeb(
    "http://127.0.0.1:9090",
    "http://127.0.0.1:9090",
    "http://127.0.0.1:9090",
    'da146374a75310b9666e834ee4ad0866d6f4035967bfc76217c5a495fff9f0d0',
)

```

### Testing

Spark sets up accounts to be used for tests with EarthCli (10 accounts by default). Once the transactions are mined, the final output is printed out:

```
Available Accounts
==================

(0) TJdDmJVYa9TcMJvCc9WsdaEXEYgeJrGVPq (100000 EARTH)
(1) TNmLX3rJZNdq7kxgxs1y39FP3hp8LWHLUX (100000 EARTH)
(2) TASrJ76QANNPRgdDHHikWWApQzxh3HPku4 (100000 EARTH)
(3) TNkzaPqNipxKbU5ecUZz7P7UdejiE82zc7 (100000 EARTH)
(4) TWCcS3cAVeNWhX1J6LHMEsEkWGq43t4EXc (100000 EARTH)
(5) TW1QH88er9UqUKhoHLdm8dQTG2NsYU6C2h (100000 EARTH)
(6) TKJu6vpKAknBwzovm5NiBZ1j69nWmeXGyw (100000 EARTH)
(7) TQUddX2gBhGV7d33a2kZchVsPuWLdZBeXY (100000 EARTH)
(8) TXjdePoR6ZRfBeiaZ9QoUyGwdHGhTPdy6x (100000 EARTH)
(9) TGJnVM3TcvsKaDL3zpNm92gw2YHrPx8s3Y (100000 EARTH)

Private Keys
==================

(0) 86134c8a51446c21b501f3a05844e18fdb72d3a5420867737c8640ce0ec656ca
(1) 57e04ac5484dd2c3d97b44c5e232b6203c2759642f38c5ea6787b0e4044de165
(2) 138a22c03039e688daa2b7c785d1e8d6b9375d4413e6ea82471b1e7a61701a9d
(3) e83a4958e81654efb162cef269e323ac501aa81d850ba9aed5a7d4f3c26d5a0a
(4) 05cdb18a4638d21d3f1f18e6bdb601a60b4debc85ee9bf8b385a2613693da24f
(5) b66225af9b24c9eb92ef65e3ff540c5c260de9fc8bb01a51fc44490bafe7ab3e
(6) 0b75b702316f1dcb2c7ca5aee9e1cd9bbdcf747e27fc417c324971caaf59772c
(7) 15e2547daf170c6f0e0dd0d64c35c1259206bc481a0c9d571bac0b1197f51d11
(8) 858c97998d9bebddc9320157e538d248dfcc64cd4c5c8ea97dfcb5d8396b37a0
(9) 32d2d45c05758f7de37a542798aac91315bd269565c99eafb33ebfb3a54ac046

HD Wallet
==================
Mnemonic:      treat nation math panel calm spy much obey moral hazard they sorry
Base HD Path:  m/44'/60'/0'/0/{account_index}

```

#### Spark options:

Use `-e` flag to pass environmental variables to the docker.
Example:

```
docker run -it \
  -p 9090:9090 \
  --rm \
  --name earth \
  -e "accounts=20" \
  earthengineering/spark
```

**List of options:**

- `accounts=12` sets the number of generated accounts
- `useDefaultPrivateKey=true` tells Spark to use the default account as `accounts[0]`
- `mnemonic=wrong bit chicken kitchen rat` uses a specified mnemonic
- `defaultBalance=100000` sets the initial balance for the generated accounts (in the example to 100,000 EARTH)
- `seed=ushwe63hgeWUS` sets the seed to be used to generate the mnemonic (if none is passed)
- `hdPath=m/44'/507'/0'/0` sets a custom bit39 hdPath. Defaults to `507'`
- `formatJson=true` formats the output
- `preapprove=...` pre approved proposals (see below for more help)

**Pre-approved proposals**

To pre-approve, for example, `getMultiSignFee` and `allowMultiSign`, you can run the images as:

```
docker run -it \
  -p 9090:9090 \
  --rm \
  --name earth \
  -e "preapprove=multiSignFee:1,allowMultiSign:1" \
  earthengineering/spark
```

For a complete list of option proposals check out https://www.earth.engineering. Note that you remove the "get" part of this chain parameter and lowercase the first character. This allows you to directly edit these parameters.

#### Available accounts

At any moment, to see the generated accounts, run

```
curl http://127.0.0.1:9090/admin/accounts
```

If you prefer to see the addresses in hex format you can run

```
curl http://127.0.0.1:9090/admin/accounts?format=hex
```

And if you like to see both formats, you can run

```
curl http://127.0.0.1:9090/admin/accounts?format=all
```

#### More accounts?

If your test requires additional accounts, use the following code to generate new addresses and retrieve them:

```js
async function newTestAccounts(amount) => {
    return await earthWeb.fullNode.request('/admin/temporary-accounts-generation?accounts=' + amount);
}

async function getTestAccounts() => {
    const accounts = {
        b58: [],
        hex: [],
        pks: []
    }
    const accountsJson = await earthWeb.fullNode.request('/admin/accounts-json');
    accounts.pks = accountsJson.more[accountsJson.more.length - 1].privateKeys
    for (let i = 0; i < accounts.pks.length; i++) {
        let addr = earthWeb.address.fromPrivateKey(accounts.pks[i]);
        accounts.b58.push(addr);
        accounts.hex.push(earthWeb.address.toHex(addr));
    }
    return accounts;
}
```

#### Persistency

If you would like to use the same accounts each time, there are two ways to do that:

1. By passing a mnemonic to the docker
2. By using `accounts.json`

Example use of `accounts.json`:

```sh
if [[ ! -d "accounts-data" ]]; then mkdir accounts-data; fi

docker run -it -p 9090:9090 \
  --name earth \
  -v $PWD/accounts-data:/config \
  earthengineering/spark
```

If `accounts-data/accounts.json` exists, Earth Spark will use it each time it runs. If you need specific addresses, you can edit `accounts.json`, put your own private keys in the `privateKeys` array, and run the container.

#### Logging

By default, the proxy server returns a verbose log, containing the response of any command. If you prefer just to know what has been called, you can add the option `-e "quiet=true"`. For consistency there is also the option `-e "verbose=true"`. In case both `"quiet=true"` and `"verbose=true"` options are passed, the `"verbose=true"` takes precedence, with `quiet` being ignored.

**verbose mode options:**

- `-e "showQueryString=true"`: shows the queryString of any command
- `-e "showBody=true"`: shows the parameter passed to a POST command

### Update environment variables

You can update environmental variables, at any time, with `curl` as follows:

```
curl http://127.0.0.1:9090/admin/set-env?showBody=true
```

### Interacting with the private network

The easiest way to interact with the private network is by using EarthWeb from the container:

```
docker exec -it earth ./earthWeb
```

It opens a console with a `earthWeb` instance ready to use. Run any command — for example: `earthWeb.toHex("some")` — to verify that it works.

### What about RPC?

If you are running [Earth Wallet-cli](https://github.com/earthengineering/wallet-cli) or any other tool which connects to the private network via RPC, you can just expose the ports . . . and voila!

```
docker run -it -p 50051:50051 -p 50052:50052 \
  --name earth \
  earthengineering/spark
```

### Known issues

**The "SERVER_BUSY" error**

Running EarthCli can put a lot of stress on the local network. If the FullNode is busy, it returns the "SERVER_BUSY" error. If it does, just repeat your command.

### Latest version is `0.1.8`

To be updated, take a look at https://hub.docker.com/r/earthengineering/spark/tags/

You can see which version you currently running executing

```
docker ps
```

If you want also to know which version of JavaEarth is used by Earth spark, run

```
curl localhost:9090/wallet/getnodeinfo
```

and look for `codeVersion`.
