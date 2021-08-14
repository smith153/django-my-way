How to Contribute
=================

Always happy to get issues identified and pull requests!

Getting your pull request merged in
------------------------------------

#. Keep it small. The smaller the pull request the more likely I'll pull it in.
#. Pull requests that fix a current issue get priority for review.

Tips
-------

- Running migrations:

  - python manage.py makemigrations model-name-here
  - python manage.py migrate model-name-here

- Create a new "app":

  - python manage.py startapp app-name-here

    - Move new app to child directory:

      - mv app-name-here parent/app-name-here
      - Update 'name' to fully qualified in: app-name-here/apps.py
      - Add app to config/settings/base.py

  - Add views  to app-name-here/views.py
  - Create app-name-here/urls.py
  - Add app to config/urls.py
  - Create app templates under templates/app-name-here/

