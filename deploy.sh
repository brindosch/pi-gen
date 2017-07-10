#!/bin/bash

# sf_upload <deploylist> <sf_dir>
sf_upload()
{
	/usr/bin/expect <<-EOD
	spawn scp $1 hyperionsf37@frs.sourceforge.net:/home/frs/project/hyperion-project/$2
	expect "*(yes/no)*"
	send "yes\r"
	expect "*password:*"
	send "$SF\r"
	expect eof
	EOD
}

deploylist="Hyperbian.zip"
if [[ $TRAVIS_EVENT_TYPE != 'pull_request' ]]; then
	cd $TRAVIS_BUILD_DIR/deploy
	echo "UPLOAD IMAGE: ${deploylist}"
	sf_upload $deploylist dev/hyperbian
fi

