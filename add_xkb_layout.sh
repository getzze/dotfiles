#!/bin/bash 

function add_keyboard {
    /usr/bin/xmlstarlet ed -P -s /xkbConfigRegistry/layoutList -t elem -n NewCustomlayout -v "" \
    -s //NewCustomlayout -t elem -n configItem -v "" \
    -s //NewCustomlayout/configItem -t elem -n name -v int \
    -s //NewCustomlayout/configItem -t elem -n shortDescription -v int \
    -s //NewCustomlayout/configItem -t elem -n description -v "International (qwerty)" \
    -s //NewCustomlayout/configItem -t elem -n languageList -v "" \
    -s //NewCustomlayout/configItem/languageList -t elem -n iso639Id -v eng \
    -s //NewCustomlayout/configItem/languageList -t elem -n iso639Id -v spa \
    -s //NewCustomlayout/configItem/languageList -t elem -n iso639Id -v ger \
    -s //NewCustomlayout/configItem/languageList -t elem -n iso639Id -v fra \
    -s //NewCustomlayout -t elem -n variantList -v "" \
    -s //NewCustomlayout/variantList -t elem -n variant -v "" \
    -s //NewCustomlayout/variantList/variant -t elem -n configItem -v "" \
    -s //NewCustomlayout/variantList/variant/configItem -t elem -n name -v colemak \
    -s //NewCustomlayout/variantList/variant/configItem -t elem -n description -v "International (Colemak)" \
    -s //NewCustomlayout/variantList/variant/configItem -t elem -n languageList -v "" \
    -s //NewCustomlayout/variantList/variant/configItem/languageList -t elem -n iso639Id -v eng \
    -s //NewCustomlayout/variantList/variant/configItem/languageList -t elem -n iso639Id -v spa \
    -s //NewCustomlayout/variantList/variant/configItem/languageList -t elem -n iso639Id -v ger \
    -s //NewCustomlayout/variantList/variant/configItem/languageList -t elem -n iso639Id -v fra \
    -r //NewCustomlayout -v layout \
    $1 | /usr/bin/xmlstarlet fo -s 2;
}

add_keyboard $1 > $1.modified

if [ !$(xmlstarlet val $1.modified >/dev/null 2>&1; echo $?) ];then
    mv $1.modified $1
fi
