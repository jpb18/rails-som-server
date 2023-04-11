# README

# Rails Som Server

This is the source code related to the article in the following link.

[put link here after publishing]

# Requirements

* Ruby 3.1.2

* Python 3.11.2

* pip 23.0.1

# Instalation:

Install the Python dependencies that we require:

```
pip install -U pip
pip install -U numpy
pip install -U scipy
pip install -U scikit-learn
pip install -U sklearn-som
```

Run `bundle install` and then start the server with `rails s`

# Scheduling

The rails gem "whenever" handles the job scheduling. To update the time interval go to `config/schedule.rb` and update the time interval in the following block:

```
every 1.hour do
  rake 'jobs:execute_som'
end
```

After that run:
```
bundle exec whenever --update-crontab
```

