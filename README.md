# Docker SAML Identity Provider Test for Open Distro
This repo contains the scripts for building a simple IdP docker image for Open Distro with SAML integration for ElasticSearch. The container is used for development and testing.

## Getting started
```
git clone https://github.com/opendistro-for-elasticsearch/opendistro-build.git
```

## Credit
   The docker build scripts are based on [simplesamlphp/simplesamlphp](https://github.com/simplesamlphp/simplesamlphp/tree/simplesamlphp-1.17)

   The image is built on official PHP7 Apache [](https://github.com/CentOS/sig-cloud-instance-images/blob/CentOS-7/docker/Dockerfile).

## Supported Docker versions

The images have been tested on Docker 18.09.2.

## Usage

```
docker run --name=samlidp-for-opendistro \
-p 8080:8080 \
-p 8443:8443 \
-d samlidp-for-opendistro
```

Change the SP entity_id by adding envrionment variable SIMPLESAMLPHP_SP_ENTITY_ID. The default value is SAML-Demo-ID. Make sure the value is identical to the SP.entity_id in ElasticSearch containers.

Change the Kiban url by adding envrionment variable BASE_KIBANA. The default value is http://localhost:5601. Make sure the value is identical to the base_kibana in ElasticSearch containers.


The default image contains eight users for IdP 

You can customize your own users by passing your own authsources.php file. 
