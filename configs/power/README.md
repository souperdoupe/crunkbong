# Crunkbong Power Management

Unlike literally most Linux distros, crunkbong uses no centralized power
manager.  Instead, it uses the same utilities directly, just like
other projects' power managers do. This is to encourage users to
actually understand the infrastructures they use.

# Structure

/etc/acpi/ (lid.sh)

/etc/acpi/events/ (lid)

/etc/pm/sleep.d/ (00lock)

By understanding the relationship between these directories, one can manually
perform many of the functions that a normal power manager does.  

# Using graphical apps with acpi scripts
There are two things necessary when running graphical apps with any acpi scripts, whether directly or indirectly

1) export DISPLAY=:0

2) su -c [command] [user]

If you're using acpi to run your power manager, be sure to tell any gui scripts (eg, slock)
run by acpi directly (eg, lid.sh) or indirectly (eg, 00lock) to use the current
X11 display to run, and run them as a specified user.

If you're running crunkbong as user 'crunkbong', you can just copy/paste the 
following into your customization, and call any gui apps with the run function:

`# Define your display`

`export DISPLAY=:0`

`# Run a specified program as user`

`run(){ su -c "$1" crunkbong; }`


# WIP
-Minimal way to suspend after a period of time.  Still working on this one.  However, in a real crunkbong environment, you probably don't want to be in a live session long enough to care about this.  
