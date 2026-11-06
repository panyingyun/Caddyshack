git pull --rebase
version=v1.2.0
git tag $version
git push origin master $version
docker login harbor.michaelapp.com -u admin -p Cjj123
docker build   --network=host -t caddyshack:latest .
docker build -t caddyshack .
docker tag caddyshack:latest harbor.michaelapp.com/caddyshack/caddyshack:$version
docker push harbor.michaelapp.com/caddyshack/caddyshack:$version