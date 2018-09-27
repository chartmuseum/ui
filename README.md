# ChartMuseumUI
[![HitCount](http://hits.dwyl.io/idobry/chartmuseumui.svg)](http://hits.dwyl.io/idobry/chartmuseumui) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)
<img src="./logo.png" width="300">
# ChartMuseumUI

ChartMuseumUI is a simple web app that can provide a nice GUI for your charts. 
ChartMuseumUI was written in Go (Golang) with the help of Beego Framework.

## Getting Started

These instructions will get you with your very own private charts repository. You can run this on your localmachine, on cloud and basically on every machine that have docker and docker-compose installed.

### Usage

ChartMuseumUI is using [ChartMuseum](https://github.com/helm/chartmuseum) as a backend so the best way would be to use docker-compose. 

For example, the following docker-compose file is defining ChartMuseum with Amazon S3 as a storage and exposing ChartMuseumUI on port 80 
```
version: '2.0'

services:
   ui:
     image: idobry/chartmuseumui:latest
     environment:
      CHART_MUSESUM_URL: "http://chartmuseum:8080"
     ports:
      - 80:8080
   chartmuseum:
     image: chartmuseum/chartmuseum:latest
     volumes:
       - ~/.aws:/root/.aws:ro
     restart: always
     environment:
      PORT: 8080
      DEBUG: 1
      STORAGE: "amazon"
      STORAGE_AMAZON_BUCKET: "chartmuseum-bucket"
      STORAGE_AMAZON_PREFIX: ""
      STORAGE_AMAZON_REGION: "eu-west-1"
     ports:
      - 8080:8080
```

Copy this file and run

```
docker-compose up 
```
Now, we can add our private repo to our Helm client

```
helm repo add <repo-name> <chartmuseum-url>
helm repo update
```
Let's upload a chart into our private repository
```
cd /chart/path
# create a chart package - this will create a .tgz file
helm package .
# copy packge name and run
curl -L --data-binary "@<packge-name>" <chartmuseum-url>/api/charts
```
In the browser, navigate to `localhost/home` to view our charts




## Built With

* [beego](https://beego.me/) - The web framework used
* [go](https://golang.org/) - Programing language
* [docker](https://www.docker.com/) - Packaged with docker


## Project Roadmap
* Add login screen
* Add more chartmuseum capabilitis:
   - Upload a chart
   - Delete a chart

## Contributing

Code contributions are very welcome. If you are interested in helping make chartmuseumui great then feel free!


## Authors

* **Ido Braunstain** - *Initial work*

See also the list of [contributors](https://github.com/idobry/contributors) who participated in this project.



