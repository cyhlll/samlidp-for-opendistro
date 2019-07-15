:<?php

$config = array(

    'admin' => array(
        'core:AdminPassword',
    ),

    'OpenDistro-userPass' => array(
        'exampleauth:UserPass',
        'admin:admin' => array(
            'uid' => array('1'),
            'eduPersonAffiliation' => array('group1'),
            'Role' => 'admin',
	        'UserName' => 'SAMLAdmin'
        ),
        'readall:readall' => array(
            'uid' => array('2'),
            'eduPersonAffiliation' => array('group2'),
	        'Role' => 'admin',
            'UserName' => 'SAMLReadall',
        ),
        'logstash:logstash' => array(
            'uid' => array('3'),
            'eduPersonAffiliation' => array('group3'),
            'Role' => 'logstash',
            'UserName' => 'SAMLLogstash',
        ),
        'snapshotrestore:snapshotrestore' => array(
            'uid' => array('4'),
            'eduPersonAffiliation' => array('group4'),
            'Role' => 'snapshotrestore',
            'UserName' => 'SAMLSnapshotrestore',
        ),
        'kibanaro:kibanaro' => array(
            'uid' => array('5'),
            'eduPersonAffiliation' => array('group4'),
            'Role' => array('kibanauser','readall'),
            'UserName' => 'SAMLKibanaro',
        ),
        'kibanaro:kibanaro' => array(
            'uid' => array('6'),
            'eduPersonAffiliation' => array('group4'),
            'Role' => array('kibanauser','readall'),
            'UserName' => 'SAMLKibanaro',
        ),
        'demoUser1:demoUser1' => array(
            'uid' => array('7'),
            'eduPersonAffiliation' => array('readall'),
            'Role' => array('readall'),
            'UserName' => 'DemoUser1',
        ),
        'demoUser2:demoUser2' => array(
            'uid' => array('7'),
            'eduPersonAffiliation' => array('readall'),
            'Role' => array('readall'),
            'UserName' => 'DemoUser2',
        ),
    ),

);
