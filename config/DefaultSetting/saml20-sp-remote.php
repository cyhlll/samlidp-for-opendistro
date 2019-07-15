<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

/*
 * Default OpenDistro SAML 2.0 SP
 */
$Default_acs = getenv(BASE_KIBANA)==null?'http://localhost:5601/_opendistro/_security/saml/acs':getenv(BASE_KIBANA).'/_opendistro/_security/saml/acs';
$Default_acs_IDP = getenv(BASE_KIBANA)==null?'http://localhost:5601/_opendistro/_security/saml/acs/idpinitiated':(getenv(BASE_KIBANA).'/_opendistro/_security/saml/acs/idpinitiated');
$Default_logout = getenv(BASE_KIBANA)==null?'http://localhost:5601/_opendistro/_security/saml/logout': getenv(BASE_KIBANA).'/_opendistro/_security/saml/logout';
$Default_sp_id = getenv(SIMPLESAMLPHP_SP_ENTITY_ID)==null?'SAML-Demo-ID': getenv(SIMPLESAMLPHP_SP_ENTITY_ID);

$metadata["$Default_sp_id"] = [
    'AssertionConsumerService' => ["$Default_acs_IDP","$Default_acs"],
    'SingleLogoutService' => "$Default_logout",
];



