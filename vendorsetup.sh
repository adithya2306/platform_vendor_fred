for device in $(cat $(gettop)/vendor/fred/fred.devices | sed -e 's/#.*$//' | awk '{printf "fred_%s-userdebug\n", $1}'); do
    add_lunch_combo $device;
done;
