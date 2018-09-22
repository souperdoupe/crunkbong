BEGIN {

    printf("%s|%s|%s|%s|%s|%s|%s|%s|%s|%s\n","MAC","SSID","freq","signal","sig%","WPA","WPA2","WEP","TKIP","CCMP");

}
$1 == "SSID:" { buf = $2; for (i = 3; i <= NF; ++i) { buf = buf" "$i } ; e["SSID"] = buf ; next }
NF > 0{
if ($1 == "BSS") {
if( $2 ~ /^[a-z0-9:]{17}$/ ) {
if( e["MAC"] ){
printf("%s - %s [ %s ][%s|%s|%s|%s|%s|%s|%s]\n",e["MAC"],e["SSID"],e["sig"],e["freq"],e["sig%"],e["WPA"],e["WPA2"],e["WEP"],e["TKIP"],e["CCMP"]);
}
    e["MAC"] = $2;
    e["WPA"] = "n";
    e["WPA2"] = "n";
    e["WEP"] = "n";
    e["TKIP"] = "n";
    e["CCMP"] = "n";
    }
}
if ($1 == "SSID:") {
e["SSID"] = $2;
}
if ($1 == "freq:") {
     e["freq"] = $NF;
}
if ($1 == "signal:") {
     e["sig"] = $2 " " $3;
     e["sig%"] = (60 - ((-$2) - 40)) * 100 / 60;
}
if ($1 == "WPA:") {
     e["WPA"] = "y";
}
if ($1 == "RSN:") {
     e["WPA2"] = "y";
}
if ($1 == "WEP:") {
     e["WEP"] = "y";
}
if ($4 == "CCMP" || $5 == "CCMP") {
     e["CCMP"] = "y";
}
if ($4 == "TKIP" || $5 == "TKIP") {
     e["TKIP"] = "y";
}
}
END {
      printf("%s - %s [ %s ][%s|%s|%s|%s|%s|%s|%s]\n",e["MAC"],e["SSID"],e["sig"],e["freq"],e["sig%"],e["WPA"],e["WPA2"],e["WEP"],e["TKIP"],e["CCMP"]);
}

