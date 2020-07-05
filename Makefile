run-in-docker:
	docker-compose build
	docker-compose up
	docker-compose run web rake db:create
	docker-compose run web rake db:migrate RAILS_ENV=development

spec:
	docker-compose run web rake spec