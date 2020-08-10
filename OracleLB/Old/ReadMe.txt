docker build -t oracleslb .
docker build --build-arg http_proxy=http://www-proxy.us.oracle.com:80 --build-arg https_proxy=http://www-proxy.us.oracle.com:80 -t oracleslb .
cat DigiCertSHA2SecureServerCA.cer.txt >> bundle.crt
cat DigiCertSHA256SecureServerCAIntermediate.cer >> bundle.crt
docker run -d --name lb443 -p 443:443 -v /scratch/p443:/etc/nginx/vhost -v /scratch/ssl:/etc/nginx/ssl oracleslb