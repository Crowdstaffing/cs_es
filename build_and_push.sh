VERSION=$1
TAG="559076975273.dkr.ecr.us-west-2.amazonaws.com/elasticsearch-s3:"$VERSION
echo $TAG
docker build -t $TAG -f ElasticSearch.Dockerfile .
$(aws ecr get-login --no-include-email --region us-west-2)
docker push $TAG
