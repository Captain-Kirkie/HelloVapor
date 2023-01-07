#  README - NOTES
## HyperText Transfer Protocol HTTP
- client -> server
- server -> client

## request
- host and path 
- request method
- headers 
- some data

GET /Hello/Kirk HTTP/1.1
HOST: localhost:8080
Accept: text/html 
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,dn;q=0.9


## response
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
Date: Mon, 27 Nov 2017 20:24:14 GMT
Content-Length: 10


Types: 
1xx Information Response
2xx Success
3xx Redirection
4xx Client Error
5xx Server Error

response body -> for webpage, html 


