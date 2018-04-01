function php-brew-reinstall()
{
    brew reinstall homebrew/php/php70 \
        --with-debug \
        --with-gmp \
        --with-homebrew-curl \
        --with-homebrew-libressl \
        --with-homebrew-libxml2 \
        --with-homebrew-libxslt \
        --with-httpd \
        --with-imap \
        --with-pear \
        --with-phpdbg \
        --with-thread-safety

    brew reinstall php70-ast       --build-from-source
    brew reinstall php70-gmp       --build-from-source
    brew reinstall php70-intl      --build-from-source
    brew reinstall php70-libsodium --build-from-source
    brew reinstall php70-mailparse --build-from-source
    brew reinstall php70-mcrypt    --build-from-source
    brew reinstall php70-opcache   --build-from-source
    brew reinstall php70-v8js      --build-from-source
    brew reinstall php70-xdebug    --build-from-source

    composer global require \
        phpunit/phpunit \
        phpunit/dbunit \
        phing/phing \
        sebastian/phpcpd \
        phploc/phploc \
        phpmd/phpmd \
        squizlabs/php_codesniffer \
        friendsofphp/php-cs-fixer etsy/phan
}
