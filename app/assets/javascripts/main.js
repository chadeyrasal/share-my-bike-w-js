const baseUrl = 'http://localhost:3000/';

$(() => {
  allCitiesClick();
  cityClick();
  newBicycleSubmission();
  sortCities();
});

const clearDom = () => {
  $('#app-container').html('');
};
