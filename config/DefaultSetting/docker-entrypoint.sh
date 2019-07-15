#!/bin/bash

BASE_DIR="/var/www/simplesamlphp"
CERT="$BASE_DIR/cert"
METADATA="$BASE_DIR/metadata"
IdP_Key="$CERT/IdP_Server.pem"
Idp_Crt="$CERT/Idp_Server.crt"
SUDO_CMD=""

if [ ! -f "$IdP_Key" ]; then
	echo "########################     Use default certificate.     ########################"
    #use the default certificate
	read -r -d '' ADMIN_CERT << EOM
-----BEGIN CERTIFICATE-----
MIIEGDCCAoACCQDJN5czRetEiDANBgkqhkiG9w0BAQsFADBOMQswCQYDVQQGEwJV
UzELMAkGA1UECAwCQ0ExCzAJBgNVBAcMAkNBMQswCQYDVQQKDAJDQTELMAkGA1UE
CwwCQ0ExCzAJBgNVBAMMAkNBMB4XDTE5MDcxMDIxMzk1OVoXDTI5MDcwOTIxMzk1
OVowTjELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAkNBMQswCQYDVQQHDAJDQTELMAkG
A1UECgwCQ0ExCzAJBgNVBAsMAkNBMQswCQYDVQQDDAJDQTCCAaIwDQYJKoZIhvcN
AQEBBQADggGPADCCAYoCggGBALwrQ6MyqPPe/FF+g+bsfLZFfv24g+vuowjYwOZk
ezGLx2zTzHqDamACBBapUTAxrqeP58MHT4x3brecmqHL0DkFS0Twu3/lhmEiBp0b
3rgI2tttg+n3MJ1wcLVUqG2Kt3On3dfWZTs4S4Dv5NyVhhSoETgLFW1ZcB0Dbd6c
W0JhvZv/IUd5sLFTgcplT8V1A5fGI3gZ+wPTQm3bf3P+ZQ+VixthoCM4x01Xx9g0
3sQvxhyspnvf+RisI5xzfjfpEbGyQeQeQLN41ODU46mU9NO7HHpOm4xr8DUTRH/d
I2C4kKkjmXjjFRqRDxnT1rLZ6rSRsL0aRw9gZT5W4RHl6nG+qUh7U5a2lqMH7eGq
VAzvFMAATfN3Q0r/MSgdaiIgxgi9Ad5SdwdmIJErzRodl8QhvK/aiMYcK10Le9kZ
Fs2ABCCxWkJ1qN/6laSqzyrv2E9dovY2IMNo3Dqn29opeIvJGB/5MUnevXFrtRet
NWS52dE7WT2p7CE/sK/7LpZoJQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBgQAjKtGs
lPXxH5SgLegRdshfxUfWelefGlUnVJiUxv7N36M7sAy2dvhsoGwPN39Q9sqNd3vo
lletmh02GmeSoY/hoCEVS0oGBBlyPECZtZQqZoIYavajOALkyFX8joiAguxjV6gC
k13ZawR5r3p4Uiu6mup/YduY06WF+4XATkT0ToHxCkPvQ7S27oV0NpDcbngfbut7
80rtrz+EjAUjkKM19KD2ocoiTmd5TwvciUfhElVPa54+yvZyDX7WUUrL9YeFAsl6
zeFEWhTX7UI7seTty1Qt/9StZFYsCkYOMvgkE8jnV2esZIle729rFRQy46c1JEzv
DvZKZOEUyvBt0qIO0KcdZeIPAa8v3nsttfarhNTtzmN+xbPr2Le14wE14hvdWr32
XEFnL1gOFOqAaBmlGKqKlM4JLR9ku1fzhKTMPmePNBg9s8v8bVkRTeUVmrVltdJc
CHQc64wBd3lmPJflZlHt8NhPb9ldVLItQm7E4ZBGCoG/vlfJsvz+jj2Hlc4=
-----END CERTIFICATE-----
EOM

	read -r -d '' ADMIN_CERT_KEY << EOM
-----BEGIN PRIVATE KEY-----
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
HaW6zfKKCeYtWUUC/Jn4DyI=
-----END PRIVATE KEY-----
EOM

	echo "$ADMIN_CERT" | $SUDO_CMD tee "$CERT/IdP_Server.crt" > /dev/null
	echo "$ADMIN_CERT_KEY" | $SUDO_CMD tee "$CERT/IdP_Server.pem" > /dev/null

else
	echo "########################      Already contains IdP private key and certificate.     ########################"
fi

if [ $Authentication_Method ]; then
	touch /var/www/simplesamlphp/modules/$Authentication_Method/enable
fi

if [ $IdP_Auth ]; then
	 sed -i -e "/^\s*'auth' => 'OpenDistro-userPass',\s*$/a\    'auth' => '${IdP_Auth}'," "$METADATA/saml20-idp-hosted.php"
	 sed -i -e "/^\s*'auth' => 'OpenDistro-userPass',\s*$/d" "$METADATA/saml20-idp-hosted.php"
fi

docker-php-entrypoint apache2-foreground

