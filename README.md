barracudalogin
==============

Perl script to login to barracuda web filter automatically.  

Use case:  You and your 'nix or Mac OS box are behind a barracuda web filter which associates your username with your IP address using Active Directory. This results in a very annoying requirement to log in on a redirect page however often the timeout is set to. 

There are other ways this login can be handled -IF- the barracuda is set up for it.  If you can use, e.g. kerberos to accomplish this, do so.  That's the better solution.  This is a workaround.

However, if you are in this situation you know it.  The barracuda reminds you.  Frequently.  

Get this little script, change the  "xxx" values to whatever is appropriate for your needs (username, password, and hostname or IP of the barracuda) and run it every so often from cron.  I have it set to every minute because I'm on a laptop so it loses its IP address fairly often.  

The script prints out Success if it logged you in, "Already logged in" if apropos, and error messages if necessary.

Comments and corrections accepted more or less graciously.
