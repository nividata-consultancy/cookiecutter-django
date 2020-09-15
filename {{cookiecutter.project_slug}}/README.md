# {{cookiecutter.project_name}}

{{cookiecutter.description}}


Settings
--------

Always put values in the .env file and in settings file fetch that value using env module

* base.py
Common settings that required on all the servers will be kept in this file

* production.py
Production server settings will be kept in this file

* local.py
Development related settings will be kept in this file

Basic Commands
--------------

Setting Up Your Users
^^^^^^^^^^^^^^^^^^^^^

* To create an **superuser account**, use this command::

    $ python manage.py createsuperuser

For convenience, you can keep your normal user logged in on Chrome and your superuser logged in on Firefox (or similar), so that you can see how the site behaves for both kinds of users.

Type checks
^^^^^^^^^^^

Running type checks with mypy:

::

  $ mypy {{cookiecutter.project_slug}}

Test coverage
^^^^^^^^^^^^^

To run the tests, check your test coverage, and generate an HTML coverage report::

    $ coverage run -m pytest
    $ coverage html
    $ open htmlcov/index.html

Running tests with py.test
~~~~~~~~~~~~~~~~~~~~~~~~~~

::

  $ pytest


{% if cookiecutter.use_celery == "y" %}

Celery
^^^^^^

This app comes with Celery.

To run a celery worker:

.. code-block:: bash

    cd {{cookiecutter.project_slug}}
    celery -A {{ cookiecutter.project_slug }}.celery_app worker -l info

Please note: For Celery's import magic to work, it is important *where* the celery commands are run. If you are in the same folder with *manage.py*, you should be right.

{% endif %}
{% if cookiecutter.use_sentry == "y" %}

Sentry
^^^^^^

Sentry is an error logging aggregator service. You can sign up for a free account at  https://sentry.io/signup/?code=cookiecutter  or download and host it yourself.
The system is setup with reasonable defaults, including 404 logging and integration with the WSGI application.

You must set the DSN url in production.
{% endif %}


Docker
^^^^^^

See detailed `cookiecutter-django Docker documentation`_.

.. _`cookiecutter-django Docker documentation`: http://cookiecutter-django.readthedocs.io/en/latest/deployment-with-docker.html
{% endif %}
