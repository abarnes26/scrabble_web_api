# README

## Project Setup

* Project was created using Ruby 2.4.1
* `rake db:setup`
* Confirm the data from `seeds.rb` is present in the database
* There's one model test that is left failing intentionally
* Get this test to pass
* Confirm you can start your Rails server and navigate to the app in your browser
* Install your preferred JSON library (i.e. [ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers), [Jbuilder](https://github.com/rails/jbuilder), [Fast JSON API](https://github.com/Netflix/fast_jsonapi))
* Install an HTTP library (i.e. [Faraday](https://github.com/lostisland/faraday), [HTTPart](https://github.com/jnunemaker/httparty))
* Decide how you want to mock HTTP calls (i.e. [Webmock](https://github.com/bblimke/webmock), [vcr](https://github.com/vcr/vcr))
* Decide how you want to handle and hide ENV variables


Notes:

#* Not quite working but everything is really close. Looks like some refactors are in progress.
#* Seems like there is a good understanding of the big picture and how things fit together
#* Tests that are present are pretty good
* Could use more unit tests
#* Controller is responsible for parsing data out of the Validator. Either the Validator or Service should be handling that.

## Evaluation Criteria

Passing assessments will meet the following criteria:

### Feature Completion

- [X] All features are functional

### Process

- [x] Git history shows student uses TDD and follows red/green/refactor
- [ ] App is well tested

### Ruby/Rails Style

- [ ] Objects used in views
- [x] No hashes used in the view
- [X] Hand built API supports non-GET requests using an external tool like Postman or cURL.
- [x] API keys are not hardcoded
- [x] Controller is not responsible for making API calls.
- [x] A service object is used for making the API call.
- [ ] The model-like object is responsible for instantiating itself and not the service object.
- [x] A model-like object is referenced in the controller when consuming an external API (e.g. Thing.filter(parameter: value)). This does not mean it should be an ActiveRecord backed model. A PORO is often the better choice.

### Refactoring

Passing assessments will implement all but two of the following

- [x] The model-like object is responsible for asking the service for data.
- [ ] Each class is broken down into small (including width) reusable methods (SRP).
- [ ] Service object is built in a way that allows portions of it to be reusable. An un-refactored example would be using string interpolation to build the API request.
- [ ] Student uses a presenter or search object in addition to a model-like PORO.
