# Dockerise a custom Nginx web server, secure and optimise it.
A Customised Nginx server built into a Docker image serving static files

## Customise the Nginx install
The Idea was to build an Nginx server with the only necessary modules
- without-http_autoindex_module
- sbin-path
- conf-path
- error-log-path
- http-log-path
- with-pcre
- pid-path
- with-http_ssl_module
- modules-path
- with-http_v2_module

## Securise the server
Prevent traffic spike
Max time to receive client headers/body
Max time for the client accept/receive a response

## Optimise the server
Limit buffer size for POST submissions
Limit buffer size for Headers
Skip buffering for static files
Optimise sendfile packets
Format the logs
Compress server response
