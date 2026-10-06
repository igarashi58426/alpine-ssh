# alpine-ssh

OpenSSH クライアントを含む軽量な Alpine ベースの Docker イメージです。

## 概要

- ベースイメージ: `alpine:latest`
- 含まれるパッケージ: `openssh-client`（`ssh`, `scp`, `sftp`, `ssh-keygen` など）
- マルチアーキテクチャ対応: `linux/amd64`, `linux/arm64`

GitHub Actions により毎日 1 回自動で再ビルドされ、常に最新の Alpine ベースイメージと最新の openssh-client が含まれる状態に保たれます。

## イメージ

```
ghcr.io/igarashi58426/alpine-ssh:latest
```

`YYYYMMDD` 形式の日付タグも付与され、過去のビルドが蓄積されていきます（例: `20261006`）。

## 使い方

```bash
docker pull ghcr.io/igarashi58426/alpine-ssh:latest

docker run --rm -it ghcr.io/igarashi58426/alpine-ssh:latest ssh user@example.com
```

SSH 鍵をマウントする例:

```bash
docker run --rm -it \
  -v "$HOME/.ssh:/root/.ssh:ro" \
  ghcr.io/igarashi58426/alpine-ssh:latest ssh -T git@github.com
```

## CI/CD

`.github/workflows/build.yml` のスケジュール（毎日 21:00 UTC）で自動ビルド・push されます。
手動実行も `workflow_dispatch` に対応しています。

## ライセンス

MIT