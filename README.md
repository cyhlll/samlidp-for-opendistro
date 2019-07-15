# Docker SAML Identity Provider Test for Open Distro
This repo contains the scripts for building a simple IdP docker image for Open Distro with SAML integration for ElasticSearch. The container is used for development and testing.

## Getting started
```
git clone https://github.com/cyhlll/samlidp-for-opendistro.git
```

## Credit
   The docker build scripts are based on [simplesamlphp/simplesamlphp](https://github.com/simplesamlphp/simplesamlphp/tree/simplesamlphp-1.17)

   The image is built on official PHP7 Apache.

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

Change the Kiban url by adding envrionment variable BASE_KIBANA. The default value is http://localhost:5601. Make sure the value is identical to the kibana_url in ElasticSearch containers.


The default image contains eight users for IdP, the first six users is the same as the users in intern-basic authentication, the next two users is for testing.

| UID | Username | Password | Role | UserID
|---|---|---|---|---|
| 1 | admin | admin  | admin | SAMLAdmin
| 2 | readall | readall | readall | SAMLReadall |
| 3 | logstash | logstash  | logstash | SAMLLogstash |
| 4 | snapshotrestore | snapshotrestore | snapshotrestore | SAMLSnapshotrestore |
| 5 | kibanaro | kibanaro  | kibanauser,readall | SAMLKibanaro |
| 6 | readall | readall | readall | SAMLReadall |
| 5 | demoUser1 | demoUser1  | readall | DemoUser1 |
| 6 | demoUser2 | demoUser2  | readall | DemoUser2 |

You can customize your own users by passing your own authsources.php file. 
