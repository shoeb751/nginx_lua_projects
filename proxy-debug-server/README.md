### Usage

Note: I am assuming that you are using a Debian based OS which contains the /etc/nginx/sites-available folder in the default install location of nginx. Also it is assumed that you have cleaned the /etc/nginx/sites-enabled folder to follow these steps as is. (This will lead to your presently hosted websites to stop working, so use with caution)

1. Install the nginx package that contains lua:
```
sudo apt install nginx-extras
```
2. Copy the contents of this folder to the /etc/nginx folder
```
sudo cp proxy-debug-server/* /etc/nginx/
```
3. Reload nginx
```
sudo nginx -s reload
```


You may also use Openresty if your distribustion does not provide a nginx + lua package.

### How it looks once it is setup:
```
$ curl 'http://ffl.shoeb.pw/pds/hello?tar=var&jolly=volley' -d "Random Post Body" -H"new-header: some value"
Request:
---
POST /pds/hello?tar=var&jolly=volley HTTP/1.1
---

Headers:
---
host: ffl.shoeb.pw
new-header: some value
accept: */*
content-type: application/x-www-form-urlencoded
content-length: 16
user-agent: curl/7.47.0
---

Query Parameters:
---
jolly: volley
tar: var
---

Request Body:
---
Random Post Body
---
```