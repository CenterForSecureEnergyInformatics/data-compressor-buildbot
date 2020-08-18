# Secrets
This is the place for secrets.
Be sure to set the correct file permissions! (chmod 600)
## htpasswd file
[htpasswd](htpasswd) contains the login credentials for the users defined in [../master.cfg](../master.cfg)
They are defined in the following form:

`contributor@email.provider:cleartext-password`

Note, that:
- Passwords have to be set in clear text
- Users have to be specified in [../master.cfg](../master.cfg)
- The user has to be a contributor in the github-project
## github access token
[githubToken](githubToken) contains the access token used by buildbot to communicate with Github.
You can define it in your Github account.


