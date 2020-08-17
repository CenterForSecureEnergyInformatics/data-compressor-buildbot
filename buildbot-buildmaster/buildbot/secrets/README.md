# Secrets
This is the place for secrets.
Be sure to set the correct file permissions! (chmod 600)
## htpasswd file
This file contains the login credentials for the users defined in `../master.cfg`.
They are defined in the following form:

`contributor@email.provider:cleartext-password`

Note, that:
- passwords have to be set in clear text
- users have to be specified in `../master.cfg`
- the user has to be a contributor in the github-project
## github access token
The access token used by buildbot to communicate with github.
You can define it in your github account.


