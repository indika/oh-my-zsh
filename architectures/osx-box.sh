# BOX configuration


# Imports
source $ZSH/architectures/box/common.sh

# Netbox Blue Specific

export BOX_DOCS=/Users/indika/dev/box/docs
export BOX_SAFECHAT=/Users/indika/dev/box/safechat



# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages/User'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm30'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library



VIRTUALENV_ROOT=/Users/indika/.virtualenvs



alias pass='pwgen -y 16'

alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmlog='find . -name "*.log" -exec rm -rf {} \;'

alias haskell='st -n $CODE_LIBRARY/Haskell $CODE_LIBRARY/Blog ~/dev/functional;cd ~/dev/functional'


# This is where the messenger work is
# WORKON=current

# This is Lync, and this is archiving
# WORKON=archiving


# WORKON=lync_archiving
# WORKON=facebook


# LINKEDIN
# This is about scanning the groups
# WORKON=linkedin_all
# WORKON=linkedin_unit


# This is about multi-tenant support
# WORKON=tenant



# THIS IS DEFAULT
WORKON=default



CURRENT_PROJECT=/Users/indika/dev/box/safechat_$WORKON


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"
alias hgbii='hg branches | grep ipiyasena'


alias safechat='$CURRENT_PROJECT'
alias nbwebscan='$CURRENT_PROJECT/nbwebscan/src/nbwebscan'

alias yahoo='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/yahoo/messenger'
alias linkedin='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin'
alias twitter='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter'
alias lync='/Users/indika/dev/box/netbox/mslync/src/mslync'


alias pass='pwgen -y 16'


alias write='st -n $CURRENT_PROJECT $CODE_LIBRARY /Users/indika/dev/box/docs /Users/indika/dev/box/helper /Users/indika/dev/functional /Users/indika/dev/opensource/synergy/src/lib/platform/OSXScreen.cpp'
alias write_lync='st -n /Users/indika/dev/box/netbox/mslync /Users/indika/dev/deploy /Users/indika/dev/box/netbox/winripclient'

alias hgb="hg branches | sort | grep 'ipiyasena'"
alias icap_spector="/Users/indika/.virtualenvs/safechat/bin/python $CURRENT_PROJECT/nbwebscan/src/nbwebscan/helper/icap_spector/icap_spector.py"



alias buildnb='ss ipiyasena@build.nb'
alias oinknew='ss ipiyasena@oink-new.nb'
# alias six= echo '10.4.10.194' | pbcopy
# alias isix='ss root@10.4.10.194'


# Generic stuff
alias movies='echo "http://thepiratebay.se/browse/201/0/7/0" | pbcopy'


function aupr()
{
    printf "-> Recursive AUP to Lego and Squid Restart\n"
    aup -r lego .
    ss lego '/etc/init.d/safechat_icap restart'
}


# HD stuff

function hd()
{
    /Users/indika/dev/hd/dist/build/hd/hd

    # Another old one
    # /Users/indika/dev/learn/explore/haskell-ncurses/dist/build/explore/explore

    # This is the old one
    # python /Users/indika/dev/sandbox/command_line/screen.py
}

function hdserver()
{

}

function hd_edit()
{
    st -n /Users/indika/dev/hd /Users/indika/dev/learn/explore/haskell-ncurses
}

function hd_build()
{
    cd /Users/indika/dev/hd
    cabal build
}

# Synergy stuff

function synergy_build()
{
    cd /Users/indika/dev/opensource/synergy
    ./hm.sh build -d
}

function synergy_cobalt_copper_server()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    ./synergys --config $CODE_LIBRARY/Tools/Synergy/synergy.cobalt_copper.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}

function synergy_cobalt_wings_server()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    ./synergys --config $CODE_LIBRARY/Tools/Synergy/synergy.cobalt_wings.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


function synergy_cobalt_client()
{
    /Users/indika/dev/opensource/synergy/bin/debug/synergyc -f --crypto-pass d95026058966f0712d9a1a361ad23f92 192.168.1.54 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


function synergy_teleport_copperhead()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    scp synergyc indika@copperhead:
}



# Instance stuff

function instance_build()
{
    cd /Users/indika/dev/functional/explore/libraries/Instance
    cabal build
}

function instance_run()
{
    /Users/indika/dev/functional/explore/libraries/Instance/dist/build/Instance/Instance
}

function instance_log()
{
    tail -f /Users/indika/logs/instance/instance.log
}

function instance_proc()
{
    runhaskell /Users/indika/dev/functional/explore/libraries/Proc.hs
}


# finish up, wrap up, close, shutdown
function wrapup()
{
    cd $BOX_DOCS
    git status

    printf "-> Delete a snapshot\n"
    printf "-> Leftovers in refridgerator\n"
    printf "-> Shutdown Lego\n"
    printf "-> Delete branch 7234\n"
    printf "Remember to see what is for later in box.next\n"
}


function twisted()
{
    cd /Users/indika/dev/learn/twisted/twisted-intro
    st -n /Users/indika/dev/learn/twisted/twisted-intro
}

function connect_proxy()
{
    cd /Users/indika/dev/box/netbox/nbsquid/src/nbsquid
    aup -r oldrel-default .
    ss oldrel-default 'service connectproxy restart'
    ss oldrel-default 'tail -f /var/log/connect_proxy.log'

}


function update_grub()
{
    cd /Users/indika/dev/box/netbox/grubaux
    aup -r motor . -v;
    ss motor "/bin/echo -e 'indika' > /tmp/grub-password"
    ss motor 'nbconf grub-config; tail -n 20 /boot/grub2/grub.cfg'
    # ss motor 'reboot'
}


function external_packages()
{
    cd /Users/indika/dev/box/internal
    aup build7.nb nb-devtools/modules/nbdev/test_sync.py
    aup build7.nb nb-devtools/modules/nbdev/sync.py
    aup build7.nb nb-devtools/modules/nbdev/sync_presync.py
    aup build7.nb nb-devtools/modules/nbdev/build.py

    # ss ipiyasena@build7.nb 'cd /home/ipiyasena/build/netbox; /usr/bin/env python2.7 -m nbdev.test_sync'
    ss ipiyasena@build7.nb 'cd /home/ipiyasena/build/netbox; /usr/bin/env python2.7 -m nbdev.sync_presync'
}

function dns-nbdb()
{
    cd /Users/indika/dev/box/netbox

    aup -r motor nbdbmaint -v

    aup motor nbadmin/src/nbdb.d/creatednsdb.py -v
    ss motor '/usr/libexec/nbdb.d/creatednsdb.py'
}


function space-chunks()
{
    cd /Users/indika/dev/box/netbox/space

    aup -r motor . -v
    ss motor 'sh /files/chunks/contents.sh'
}


function last_command()
{
    var=`tail -2 ~/.zsh_history | head -1`
    echo $var | grep -oE ';(.*)' | cut -c 2- | pbcopy
}



function ad()
{
    ag -C5 --ignore-case $1 $CODE_LIBRARY $BOX_DOCS
}

function hashchat()
{
    curl http://misc-c7.nb:8007/messages\?channels\=%23chat\&limit\=1000 | grep something
}


function flush_redis()
{
    printf "Resetting Cache\n"
    ss lego 'redis-cli -n 1 flushdb'
}

function clear_bundles()
{
    printf "Clearing all bundles\n"
    ss lego 'rm -rf /var/nbwebscan/bundles/*'
}


function lxml_sandbox()
{
    cd /Users/indika/dev/box/lxml_sandbox
    st -n /Users/indika/dev/box/lxml_sandbox

}


function lync_msi()
{

    ss ipiyasena@oink-new.nb 'ls -lht /packages/netbox-29.5.2/mslync*'
    scp ipiyasena@oink-new.nb:/packages/netbox-29.5.2/mslync-29.5.2-2.i686.rpm .
    sc mslync-29.5.2-2.i686.rpm lego:

    # Join commands using monoids
    ss lego 'rpm -U mslync-29.5.1-24.i686.rpm; rpm -qa | grep mslync'
}

function update_lync()
{
    update_tools;
    cd ~/dev/box/netbox
    aup -r lego mslync;
    aup -r lego winrip;
    aup -r lego winripclient;
    update_lego
    ss lego 'service winrip restart'
    clear_bundles
    flush_redis
}

function test_lync()
{
     cd /Users/indika/dev/box/netbox/mslync/src/mslync
     aup -r lego .
     ss lego 'python /usr/lib/python2.7/site-packages/mslync/window.py'
     # ss lego 'python /usr/lib/python2.7/site-packages/mslync/test/schema_create.py'
}


function cloud_test_framework()
{
    ss isix 'redis-cli -n 1 flushdb'
    ss isix 'rm -f /tmp/messages/*'
    aup -r isix /Users/indika/dev/box/netbox/cloudcte
    ss isix '/opt/rh/python27/root/usr/bin/supervisorctl restart cloudcte'

    # ss isix '/opt/rh/python27/root/usr/bin/supervisorctl restart safechat:safechat-icap'
    ss isix '/opt/rh/python27/root/usr/bin/python -m icapstestframework.client localhost 1344 --data-path /root/requests/ --nossl --tenant testing'
    ss isix '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/lib/python2.7/site-packages/cloudcte/cte_content_dispatcher.py' 2>&1 | tee test_cte.log

    # sc isix:/tmp/messages/email* /Users/indika/temp/email_messages
    rm -f /Users/indika/temp/email_messages/messages/*
    sc -rp 10.107.11.221:/tmp/messages /Users/indika/temp/email_messages
}


function test_cte()
{
    cd /Users/indika/dev/box/netbox/cloudcte
    # update_isix

    aup -r 10.4.10.194 .

    ss root@10.4.10.194 'restore_archive'
    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/lib/python2.7/site-packages/cloudcte/cte_content_dispatcher.py' 2>&1 | tee test_cte.log

    ag -B 1 -A 3 'indika' test_cte.log
}

function test_cloud_nbwebscan()
{
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan --restrict=cloud
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbarchive --restrict=cloud
    aup -r 10.4.10.194 /Users/indika/dev/box/netbox/cloudcte --restrict=cloud

    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/bin/supervisorctl restart safechat:safechat-icap'
    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/bin/supervisorctl restart cloudcte'

    ss root@10.4.10.194 'recreate_archive'


    printf '\nSleeping for 12s\n'
    sleep 12s
    ss root@10.4.10.194 '/usr/bin/send-icap-data localhost 1344 --data-path /root/requests/ --nossl --tenant testing'
}


function test_multi_tenant_isix()
{
    printf "Uploading the latest JSON schema\n"
    sc ~/dev/box/netbox/cloudconfig/schemas/multitenant-schema.json root@10.4.10.194:/usr/share/nbb/schemas/multitenant-schema.json

    printf "All files (src/nbwebscan/) are being AUPed to LEGO\n"
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/test

    # rununittest 10.4.10.194 -c -t '-xsk test_nbbdev_tenant' test_multitenant.py
    # rununittest 10.4.10.194 -c  test_multitenant.py
    # rununittest 10.4.10.194 -n -t '-xvs --report=skipped' test_multitenant.py
    rununittest 10.4.10.194 -n -t '-xvs' test_multitenant.py 2>&1 | tee test_multitenant.py.log

    ag -B 1 -A 3 'indika' test_multitenant.py.log
    ag -B 1 -A 3 'FAIL' test_multitenant.py.log
    ag -B 1 -A 3 'passed' test_multitenant.py.log
}

function test_bb_transcripts()
{
    printf "Uploading the latest JSON schema\n"

    SAMPLE_NAME=vault-transcripts-groupConversation-attach.xml
    SCHEMA=/Users/indika/dev/box/netbox/cloudcte/schemas/vault-transcripts.xsd
    SAMPLE=/Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test/samples/$SAMPLE_NAME
    # SAMPLE=/Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test/samples/vault-transcripts-groupConversation.xml
    print $SAMPLE

    # samples/vault-transcripts-chatConversation.xml

    printf "Locally linting\n"
    xmllint --noout --schema $SCHEMA $SAMPLE
    printf "Done locally linting\n\n\n\n"




    sc $SCHEMA root@10.4.10.194:/usr/share/nbb/schemas/vault-transcripts.xsd
    # sc $SAMPLE root@10.4.10.194:/usr/share/nbb/schemas/samples/$SAMPLE_NAME

    printf "CTE is being AUPed to LEGO\n"
    aup -r 10.4.10.194 --restrict=cloud /Users/indika/dev/box/netbox/cloudcte/src/cloudcte
    cd /Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test

    rununittest 10.4.10.194 -n -t '-xvs --report=skipped' test_transcripts.py 2>&1 | tee test_transcripts.py.log
    ag -B 1 -A 3 'indika' test_transcripts.py.log
    ag -B 1 -A 3 'FAIL' test_transcripts.py.log
    ag -B 1 -A 3 'passed' test_transcripts.py.log
}


function test_on_lego()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"


    hg baup lego $CURRENT_PROJECT
    # hg baup 10.3.115.254 $CURRENT_PROJECT
    rununittest lego -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log
    # rununittest 10.3.115.254 -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}


function test_on_motor()
{
    printf "All files (src/nbwebscan/) are being AUPed to MOTOR\n"
    aup -r motor $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    rununittest motor -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}


function test_on_isix()
{
    printf "All files (src/nbwebscan/) are being AUPed to ISIX\n"
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    rununittest 10.4.10.194 -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1

}




function facebook()
{
    printf "Facebook\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test
}


function facebook_protocol_handlers()
{
    ag "r\'\^http.*?\'" $CURRENT_PROJECT -G py
}



function test_all_in_directory()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT


    for f in test_*.py
    do
        # echo $f
        filename="${filename%.*}"
        echo filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function test_all_facebook()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test/test_*.py
    do
        # echo $f
        filename="${filename%.*}"
        echo filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function test_all_broken_facebook()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/

    printf "Running all on Lego\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test

    rununittest lego -n -t '-xvs --report=skipped' test_chat_bigpipe_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_chat_with_attachments.py
    rununittest lego -n -t '-xvs --report=skipped' test_json_comments.py
    rununittest lego -n -t '-xvs --report=skipped' test_messages_with_images.py
    rununittest lego -n -t '-xvs --report=skipped' test_news_dynamic_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_news_initial_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_post_image_album.py
    rununittest lego -n -t '-xvs --report=skipped' test_pull.py
}

function test_facebook_comments()
{
    printf "Facebook is being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook

    rmlog

    for TARGET_FILE in test_comment_decoding.py test_comment_send.py test_comment_send_nested.py test_comment_xhr.py test_json_comments.py test_spam_comment.py test_view_comment_decoding.py test_view_html_comments.py
    do
        printf "TESTING: %s" % $TARGET_FILE
        rununittest lego -n -t '-vs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    done

    for TARGET_FILE in *.log
    do
        ag -B 1 -A 3 'indika' $TARGET_FILE
        ag -B 1 -A 3 'FAIL' $TARGET_FILE
        ag -B 1 -A 3 'passed' $TARGET_FILE

        printf "TESTING: %s" % $TARGET_FILE
    done
}

function test_facebook_chat()
{
    test_on_lego test_chat_bigpipe_load.py
    test_on_lego test_chat_dynamic_load.py
    test_on_lego test_chat_history.py
    test_on_lego test_chat_receive.py
    test_on_lego test_chat_send.py
    test_on_lego test_chat_with_attachments.py
}

function test_facebook()
{
    printf "Selective NBWebscan is being AUPed\n"
    baup -r lego $CURRENT_PROJECT

    # TARGET_FILE=test_chunks.py
    # TARGET_FILE=test_comments.py
    # TARGET_FILE=test_json_comments.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log

    printf "TESTING: %s" % $TARGET_FILE
}

function test_facebook_failing()
{
    printf "Facebook is being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook

    TARGET_FILE=test_chunks.py
    TARGET_FILE=test_comment_send.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log

    printf "TESTING: %s" % $TARGET_FILE
}




function twitter()
{
    printf "Twitter\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test
}


function test_flux()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan

    TARGET_FILE=test_create_group.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    # cat $TARGET_FILE.log | ag 'indika'
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log
}


function test_yahoo()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan
    # TARGET_FILE=test_group_read_all_discussions.py
    # TARGET_FILE=test_group_read_discussion.py

    # Having trouble testing the spoofed case
    # TARGET_FILE=test_read_message.py
    TARGET_FILE=test_send_message.py

    # This test has always failed
    # TARGET_FILE=test_messages_read_message.py


    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    # cat $TARGET_FILE.log | ag 'indika'
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log
    # cat test_create_group.py.log | ag 'indika'

    printf "TESTING: %s" % $TARGET_FILE
}


function test_all_linkedin()
{
    $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test
    rmlog

    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function query_all_linkedin()
{

    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/data/icap/icap*respmod*.request
    do
        # filename="${filename%.*}"
        # echo $filename
        echo $f
        showicap --bare $f | htmlselect - "li.feed-item.linkedin-comment"

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

}


function test_linkedin_messages()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_messages*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}


function test_linkedin_groups()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_group*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}


function test_all_twitter()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test/test_*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function test_twitter_messages()
{
    test_on_lego test_direct_messages_json.py
    test_on_lego test_sent_direct_message.py

    #TODO: The session viewer needs to be set
    #test_on_lego test_toasts.py
    test_on_lego test_groups.py
}


function update_tools()
{
    cd /Users/indika/dev/
    ss lego 'rm /home/httpd/netbox/noauth/deploy.tar'
    sc /Users/indika/dev/box/docs/box.win.bash_rc.txt lego:/home/httpd/netbox/noauth


    rm -rf /Users/indika/dev/deploy/mslync
    cp -R /Users/indika/dev/box/netbox/mslync/src/mslync /Users/indika/dev/deploy/

    cp -R /Users/indika/dev/box/netbox/winripclient/src/winripclient /Users/indika/dev/deploy
    cp -R /Users/indika/dev/box/netbox/winrip/src/winrip /Users/indika/dev/deploy

    tar cfz - "deploy" | ss lego 'cat > /home/httpd/netbox/noauth/deploy.tar'

    cd ~/dev/box/netbox
}

function motor_post_init()
{
    sc /Users/indika/dev/box/docs/box.motor.bash_rc.txt motor:.bashrc
}

function shan_post_init()
{
    scp /Users/indika/dev/box/docs/box.shan.bash_rc.txt root@shan:.bashrc
}


function update_lego()
{
    printf "A differential update of Lego with Current Project $CURRENT_PROJECT\n"
    hg baup lego $CURRENT_PROJECT

    # printf "-> Flushing Redis Cache\n"
    # ss lego 'redis-cli -n 1 flushdb'

    ss lego 'supervisorctl restart safechat:safechat-icap'
}

function update_netbox_lego()
{
    printf "A differential update of Lego with the Netbox\n"
    hg baup lego /Users/indika/dev/box/netbox
}


function update_reports()
{
    # printf "A differential update of Lego with Reports \n"
    # # hg baup lego /Users/indika/dev/box/netbox/nbreports

    # aup lego /Users/indika/dev/box/netbox/nbreports/src/core/feed -v
    # aup lego /Users/indika/dev/box/netbox/nbreports/src/core/db_test.py -v
    # # aup lego /Users/indika/dev/box/netbox/nbreports/src/core/progress.py -v

    # # ss lego 'cat /usr/libexec/nbreports/feed | grep indika'
    # # ss lego 'python /usr/libexec/nbreports/feed'
    # ss lego 'python /usr/libexec/nbreports/db_test.py'

    # print "\n\n\n\n"


    # UPDATE THE PSYCO MODULE
    # cd /Users/indika/temp
    # sc ipiyasena@build7.nb:/var/spool/build/user/ipiyasena/RPMS/x86_64/python-psycopg2-2.4.5-8nb.el7.centos.x86_64.rpm .
    # sc python-psycopg2-2.4.5-8nb.el7.centos.x86_64.rpm motor:
    # ss motor 'rpm -Uvh --force python-psycopg2-2.4.5-8nb.el7.centos.x86_64.rpm'
    # ss motor 'ls -l /usr/lib64/python2.7/site-packages/psycopg2/_psycopg.so'


    aup motor /Users/indika/dev/box/netbox/nbreports/src/core/feed -v
    aup motor /Users/indika/dev/box/netbox/nbreports/src/core/db_test.py -v
    aup motor /Users/indika/dev/box/netbox/nbreports/src/core/progress.py -v
    # ss motor 'cat /usr/libexec/nbreports/feed | grep indika'
    ss motor 'python /usr/libexec/nbreports/feed'
    # ss motor 'python /usr/libexec/nbreports/db_test.py'

    ss motor 'systemctl restart nbreports.service'
    ss motor 'systemctl | grep failed'
    # ss motor 'journalctl -u nbreports.service'
}



fuction test_postgrey()
{
    aup motor /Users/indika/dev/box/netbox/nbpostfix/src/nbpostfix/postgrey.py -v
    ss motor 'systemctl restart postgreyd.service'
}





function update_ytcache()
{
    printf "A differential update of Lego with YTCACHE \n"
    hg baup lego /Users/indika/dev/box/netbox/ytcache

    # printf "-> Flushing Redis Cache\n"
    # ss lego 'redis-cli -n 1 flushdb'

    ss lego 'supervisorctl restart ytcache'
    ss lego 'supervisorctl restart ytcache-icap'
    # ss lego 'less /var/log/ytcache/access'
}


function social_update_lego()
{
    printf "A differential update of Lego with Current Project $CURRENT_PROJECT\n"
    hg baup lego $CURRENT_PROJECT

    # ss lego 'supervisorctl restart socialmediaapp'

    ss lego '/usr/libexec/socialmediaapp/fbdiagnostic'
}



function update_isix()
{
    printf "Updating ISIX Recursively from here\n"

    # aup cool-cloud-vm --restrict=cloud
    aup -r 10.4.10.194 --restrict=cloud --verbose
}

function fetch()
{
    sc lego:$1 /Users/indika/temp/lego_cache
    st /Users/indika/temp/lego_cache/$1
}

function fetch_icaps()
{
    #cat /var/log/safechat/icap | grep 'XI ICAP.*for URL.*https://twitter.com/i/discover'

    printf "Fetching ICAPs from Lego\n"
    rm -rf /Users/indika/temp/icaps
    mkdir /Users/indika/temp/icaps

    sc lego:/var/tmp/safechat/icap/\*.request   /Users/indika/temp/icaps/

    # Now parse them
    /Users/indika/.virtualenvs/safechat/bin/python /Users/indika/dev/box/helper/icap_inspector/data/icaps/icap_plain_text.py --dir /Users/indika/temp/icaps

    for f in /Users/indika/temp/icaps/*.request
    do
        filename="${f}.txt"
        echo $filename
        # rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log
        showicap --pretty $f > $filename

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done
}

function fetch_bundles()
{
    printf "Re-Fetching Bundles from ISIX\n"
    sc -r 10.107.11.228:/var/nbwebscan/bundles /Users/indika/temp/bundles
}

function fetch_cache()
{
    printf "Re-Fetching Debug cache from Lego\n"
    cd ~
    rm -rf /Users/indika/temp/debug_cache
    sc -r lego:/tmp/debug_cache /Users/indika/temp/debug_cache
    cd ~/temp/debug_cache
    fdupes -dN ~/temp/debug_cache
}

function clear_cache()
{
    printf "Clearing Debug cache on Lego\n"
    ss lego 'rm -rf /tmp/debug_cache/*'
    ss lego 'mkdir -p /tmp/debug_cache'

}

function sync_cobalt()
{
    printf "Syncing repositories in Cobalt\n"

    printf "Syncing OH MY ZSH\n"
    cd /Users/indika/.oh-my-zsh
    git commit -m 'autocommit'
    git pull origin master
    git push origin master

    printf "Syncing Box Notes\n"
    cd /Users/indika/dev/box/docs
    git add *
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    printf "Syncing OH MY ZSH\n"
    cd /Users/indika/.oh-my-zsh
    git commit -a -m 'autocommit'
    git pull hub master
    git push hub master

    printf "Syncing Boxen\n"
    cd /opt/boxen/my-boxen
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master

    printf "Syncing Sublime\n"
    cd $CONFIG_SUBLIME
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master

    printf "tweaking\n"
    cd '/Users/indika/Library/Application Support/Sublime Text 3/Packages/SublimePushBullet'
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master
}



# activate
source $VIRTUALENV_ROOT/safechat/bin/activate


