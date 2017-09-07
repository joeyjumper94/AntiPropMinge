#Anti_Prop_Minge
i created this to foil prop killers and prop spammers

to install, just extract the zip file and drop Anti_Prop_Minge-master into the server's addon folder

Workshop version http://steamcommunity.com/sharedfiles/filedetails/?id=1129686491

A series of serverside scripts i put together with the intent of preventing propkill based minges.

Falco's Prop Protecion is needed for this to work.

the server side convars:

0 = disabled, 1=enabled

apm_freeze_all_anonymity, default is 0.
#decides if freezall is annonymous to non admins.

apm_prop_suicide_notification, default is 1.
#decide whether to notify admins if someone is hit by their own prop.

apm_notify_on_damage, default is 0.
#decide whether to notify admins if someone is damaged by a prop.

apm_freeze_on_damage, default is 0.
decide whether to freeze a player's props if they damage someone.

apm_allow_prop_damage, default is 0.
decide if players can be lose health or die from prop damage.

apm_allow_vehicle_damage, default is 1.
decide if players can be lose health or die from getting hit by vehicles.

apm_notify_on_vehicle_damage, default is 0.
decide whether to notify admins if someone is damaged by a vehicle.

apm_strict_damage_check, default is 0.
decide if we use strict damage checks, it will block ALL sources of crush damage.

and the console commands:

apm_freeze_all_ents.
( only works from the server console or if the server thinks you are an admin)

apm_freeze_my_stuff.
