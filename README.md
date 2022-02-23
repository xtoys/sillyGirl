&nbsp;

<p align="center">
  <img src="./assets/bot.svg" width="20%" alt="bot" />
</p>
<p align="center">
   <b>Bot.</b>&nbsp;
</p>

&nbsp;

### 容器部署

> `docker-compose.yml`

```yml
version: '3'
services:
  bot:
    image: xtoys/silly-girl:latest
    container_name: sillyGirl
    network_mode: bridge
    hostname: bot
    tty: true
    stdin_open: true
    restart: unless-stopped
    ports:
      - '5800:8080'
    extra_hosts:
      - 'github.com:140.82.121.3'
      - 'raw.githubusercontent.com:185.199.108.133'
    volumes:
      - ./plugin:/app/plugin
      - ./develop:/app/develop
```
