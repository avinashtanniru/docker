docker build -t oracleslb .
docker build --build-arg http_proxy=http://www-proxy.us.oracle.com:80 --build-arg https_proxy=http://www-proxy.us.oracle.com:80 -t oracleslb .
cat DigiCertSHA2SecureServerCA.cer.txt >> bundle.crt
cat DigiCertSHA256SecureServerCAIntermediate.cer >> bundle.crt
docker run -d --restart always --name lb443 -p 443:443 -v /u01/p443:/opt/nginx/vhost -v /u01/ssl:/opt/nginx/ssl oracleslb