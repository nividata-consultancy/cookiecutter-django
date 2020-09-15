# {{cookiecutter.project_name}}

{{cookiecutter.description}}


Settings
--------

Always put values in the .env file and in settings file fetch that value using env module

* base.py
    * Common settings that required on all the servers will be kept in this file

* production.py
    * Production server settings will be kept in this file

* local.py
    * evelopment related settings will be kept in this file

Basic Commands
--------------


* To create an **superuser account**, use this command::

```
    $ python manage.py createsuperuser
```

* To validate python types, run type checks with mypy:

```
    $ mypy {{cookiecutter.project_slug}}
```

Test coverage
-------------

* To run the tests, check your test coverage, and generate an HTML coverage report

```
    $ coverage run -m pytest
    $ coverage html
    $ open htmlcov/index.html
```

* Running tests with py.test


```
  $ pytest
```


Important Services
------------------
{% if cookiecutter.use_celery == "y" %}

* Celery

This app comes with Celery. To run a celery worker:

```
    $ cd {{cookiecutter.project_slug}}
    $ celery -A {{ cookiecutter.project_slug }}.celery_app worker -l info
```
Please note: For Celery's import magic to work, it is important *where* the celery commands are run. If you are in the same folder with *manage.py*, you should be right.

{% endif %}

{% if cookiecutter.use_sentry == "y" %}

* Sentry

Sentry is an error logging aggregator service. You must set the DSN url in production.

{% endif %}

{% if cookiecutter.use_docker == "y" %}
* Docker

See detailed `cookiecutter-django Docker documentation`_.

.. _`cookiecutter-django Docker documentation`: http://cookiecutter-django.readthedocs.io/en/latest/deployment-with-docker.html

{% endif %}
